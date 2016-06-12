// Preamble
grammar Fsml;
@header {
	// Injection of package into generated code
	package org.softlang;
}

// Grammar rules
fsm : statedecl* EOF ;
statedecl : 'initial'? 'state' stateid '{' transition* '}' ;
transition : event ('/' action)? ('->' stateid)? ';' ;
stateid : NAME ;
event : NAME ;
action : NAME ;
NAME : ('a'..'z'|'A'..'Z')+ ;
WS : [ \t\n\r]+ -> skip ;
