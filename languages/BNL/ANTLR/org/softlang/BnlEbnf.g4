grammar BnlEbnf;
@header {
package org.softlang;
}
number 	: bit+ ('.' bit+)? WS? EOF;
bit 	: '0' | '1';
WS : [ \t\n\r]+ ;
