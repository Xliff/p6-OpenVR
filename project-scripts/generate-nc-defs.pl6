use v6;

use OpenVR::Raw::Constants;
use OpenVR::Raw::Definitions;
use OpenVR::Raw::Enums;
use OpenVR::Raw::Structs;

use NativeCall;

sub mq ($s) {
  "{ $s }\n{ '=' x $s.chars }"
}

sub indent ($s, $n = 1) {
  $s.lines.map( ('  ' x $n) ~ * ).join("\n")
}

my token id { <[\w _]>+ }

my token typeDec {
  'const'? [ <.ws> 'struct' ]? <.ws> <type=id> <.ws> $<p>=('*')?
}

sub isTypeRW ($t) {
  $t[1] ?? ' is rw' !! ''
}

sub resolveTypeDec ($td) {
  my $rw = False;

  my $rt = do given ($td<type> // '').Str {
    when ''       { $_      }

    when 'char'   { 'Str'   }

    when 'float'  { 'num32' }
    when 'double' { 'num64' }

    when
        'int8_t'   |
        'int16_t'  |
        'int32_t'  |
        'int64_t'  |
        'uint8_t'  |
        'uint16_t' |
        'uint32_t' |
        'uint64_t'   { $rw = True if $td<p>;
                       .substr(0, * - 2)     }

    default {
      # If not a struct and ends with _t, it needs
      # to be 'is rw'
      my $tv := ::("$_");
      die "Type '$_' is not defined!" if $tv ~~ Failure;
      $rw = True unless $tv.REPR eq 'CStruct';
      $_
    }
  }

  ($rt, $rw);
}

sub outputNCMethods(\T) {
  my @methods = do gather {
    my %methods = (do for T.^methods.map( *.name ) {
      $_ => 1;
    }).Hash;

    for T.^attributes {
      my $mn = .name.substr(2);

      my $sd = .WHY.trailing;
      my $m = $sd ~~ rule {
        <typeDec>?
         [
          '(' (<-[\)]>+) ')'
          ||
          '()'
        ] ';'
      };

      my ($rt, $al) = (
        resolveTypeDec($/<typeDec>),
        $0 // ''
      );

      next if %methods{$mn};

      unless $m {
        say "{ mq($mn) }";
        say "»»»»» DID NOT PARSE!\n";
        next;
      }

      #say "Returns: $rt";

      my $ma = $al ~~ m:g/
        <typeDec> <.ws>
        <name=id> [ ',' <.ws> ]?
      /;

      #$ma.gist.say;

      my (%var-names, @at, @an);
      for $ma[] -> $am {
        my $n := $am<name>;
        # Get variable placeholder name.
        my $vn = (
          ($n ~~ m:g/<[A..Z]><[a..z]>+/).map(
            *.Str.substr(0, 1).lc
          ).join
          ||
          $n.substr(0, 1)
        );
        # Finalize name with collision detection.
        $vn = '$' ~ $vn ~ (%var-names{$vn}++ ?? %var-names{$vn}
                                             !! '');
        @an.push: $vn;

        #$am.gist.say;

        @at.push: resolveTypeDec( $am<typeDec> );
      }

      my @norml-at = @at.map({ .[0] ~ isTypeRW($_) });
      my $nc = qq:to/NATIVECAST/;
      nativecast(
        :({ @norml-at.join(', ')}{ ($rt && $rt[0]) ?? " --> { $rt[0] }" !! '' }),
        \$!{$mn}
      )({@an.join(', ')})
      NATIVECAST

      if $rt && ::("{$rt[0]}Enum") !~~ Failure {
        $nc = qq:to/ENUMCAST/;
          { $rt[0] }Enum(
          { $nc = indent($nc); }
          );
          ENUMCAST
      }

      # Construct proper parameter list with "is rw", if required.
      my @pl = (@at Z @an).map({ .[0][0] ~ ' ' ~ .[1] ~ isTypeRW( .[0] ) });

      take qq:to/METHOD/;
        method {$mn} ({ @pl.join(', ') }) \{
        { $nc = indent($nc) }
        \}
        METHOD

    }
  }

  say qq:to/CLASS/;
    class { T.^name } \{
    { @methods.map({ indent($_) }).join("\n\n") }
    \}
    CLASS
}

outputNCMethods($_)
  for OpenVR::Raw::Structs::EXPORT::DEFAULT.WHO
                                           .values
                                           .grep( * ~~ OpenVRInterface);
