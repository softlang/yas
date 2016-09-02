grammar FsmlToObjects;
@header { package org.softlang; }
@members { public Fsm fsm = new Fsm(); }

fsm : state* EOF ;
state : 
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
  {fsm.getTransitions().add(new Transition(source, $event.text, action, target));}
  ';'
  ;
stateid : NAME ;
event : NAME ;
action : NAME ;
NAME : ('a'..'z'|'A'..'Z')+ ;
WS : [ \t\n\r]+ -> skip ;
