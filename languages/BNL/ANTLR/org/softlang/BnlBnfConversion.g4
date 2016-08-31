grammar BnlBnfConversion;

@header { package org.softlang; }

number returns [float val]
    : bits rest WS? EOF
    { $val = $bits.val + $rest.val; }
    ;
bits returns [float val, int len]
    : bit { $val = $bit.val; $len = 1; }
    | bits1=bits bit
      { $val = 2*$bits1.val + $bit.val; $len = $bits1.len + 1; }
    ;
bit returns [int val]
    : '0' { $val = 0; }
    | '1' { $val = 1; }
    ;
rest returns [float val]
    : { $val = 0; }
    | '.' bits { $val = $bits.val / (float)Math.pow(2, $bits.len); }
    ;
WS : [ \t\n\r]+ ;
