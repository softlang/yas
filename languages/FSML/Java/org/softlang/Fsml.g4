// Preamble
grammar Fsml;
@header {
	// Injection of package and import into generated code
	package org.softlang;
	import org.softlang.influent.*;
}
@members {
	// Injection of attribute for FSM model
	public Fsm fsm = new Fsm();
}

// Grammar rules
fsm : statedecl* EOF ;
statedecl : 
  {boolean initial = false;} 
  ('initial' {initial = true;})? 
  'state' stateid
  {fsm.getStates().add(new State($stateid.text, initial));}
  '{' transition[$stateid.text]* '}'
  ;
transition[String source] : 
  event 
  {String action = null;}
  ('/' action {action = $action.text;})? 
  {String target = source;} 
  ('->' stateid {target = $stateid.text;})?
  {fsm.getTranss().add(new Trans(source, $event.text, action, target));}
  ';'
  ;
stateid : NAME ;
event : NAME ;
action : NAME ;
NAME : ('a'..'z'|'A'..'Z')+ ;
WS : [ \t\n\r]+ -> skip ;
