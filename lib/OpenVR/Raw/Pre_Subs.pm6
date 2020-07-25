use v6.c;

unit package OpenVR::Raw::Pre_Subs;

# "Exhaustive" maximal...
multi max (:&by = {$_}, :$all!, *@list) is export {
    # Find the maximal value...
    my $max = max my @values = @list.map: &by;

    # Extract and return all values matching the maximal...
    @list[ @values.kv.map: {$^index unless $^value cmp $max} ];
}

# cw: Remember...Credit where its due
sub getLongestSubstr(*@strings) is export {
  (max :all, :by{.chars}, keys [∩] @strings».match(/.+/, :ex)».Str)[0]
}

# cw: Thank you RC! -- https://www.rosettacode.org/wiki/Count_occurrences_of_a_substring#Raku
sub count-substring($big,$little) is export {
  +$big.comb: ~$little
}
