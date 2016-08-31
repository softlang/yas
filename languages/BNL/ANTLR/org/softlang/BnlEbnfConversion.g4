grammar BnlEbnfConversion;
@header {
package org.softlang;
}
number returns [float val] :
 	{ $val = 0; } 
	( bit1=bit { $val = $val*2 + $bit1.val; } )+ 
	('.'
	     { float place = 0.5f; }
	     ( bit2=bit { $val += $bit2.val*place; place /= 2; } )+
	)? 
	WS?
	EOF;

bit returns [float val] : 
		( '0' { $val = 0; } )
	| 	( '1' { $val = 1; } )
	;

WS : [ \t\n\r]+ ;
