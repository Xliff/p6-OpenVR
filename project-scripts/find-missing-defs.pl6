use OpenVR::Raw::Definitions;
use OpenVR::Raw::Enums;
use OpenVR::Raw::Structs;

my $ovrDefs = "/usr/include/openvr/openvr.h".IO.slurp;

for ($ovrDefs ~~ m:g/^^ ["struct" | "enum" ] " " (<[_ \w]>+)  /)[] {
  say .[0] if ::("{ .[0].Str }") ~~ Failure
}
for ($ovrDefs ~~ m:g/ "k_" (<[_ \w]>+) /)[] { .[0].say }
