use OpenVR::Raw::Constants;
use OpenVR::Raw::Definitions;
use OpenVR::Raw::Enums;
use OpenVR::Raw::Structs;

my $ovrDefs = "/usr/include/openvr/openvr.h".IO.slurp;

my %listed = (
  # False Positives
  k_unMaxCameras             => 1,
  k_unTrackedDeviceIndex_Hmd => 1,
);

for ($ovrDefs ~~ m:g/^^ ["struct" | "enum" ] " " (<[_ \w]>+)  /)[] {
  next if %listed{ .[0].Str.trim }:exists;
  %listed{ .[0].Str.trim } = 1;
  my $e = ::( .[0].Str.trim ).^name;

  say .[0].Str if $e eq <Failure False>.any;
}

for ($ovrDefs ~~ m:g/ «"k_" (<[_ \w]>+) /)[] {
  next if %listed{ .Str };

  my $e;
  try {
    CATCH { default { $e = '!Failure!' } }
    $e = ::("{ .Str }").^name;
  }

  say .Str if $e eq '!Failure!';
  %listed{ .Str };
}

for ($ovrDefs ~~ m:g/ (<[_ \w]>+?)'_t'» /)[] {
  next unless .chars;
  next if .[0] eq <
    uint8  int8
    uint16 int16
    uint32 int32
    uint64 int64
  >.any;
  next if %listed{ .Str };

  my $e = ::("{ .Str }").^name;
  say .Str if $e eq 'Failure';

  %listed{ .Str } = 1;
}
