grammar FsmlToObjects2;
@header {package org.softlang.fsml;}

fsm returns [Fsm result] :
  {$result = new Fsm();} 
  state[$result]+ 
  EOF
  ;
state[Fsm result] : 
  {boolean initial = false;} 
  ('initial' {initial = true;})? 
  'state' stateid
  {String source = $stateid.text;}
  {$result.getStates().add(new State(source, initial));}
  '{' transition[$result, source]* '}'
  ;
transition[Fsm result, String source] :
  event 
  {String action = null;}
  ('/' action {action = $action.text;})? 
  {String target = source;} 
  ('->' stateid {target = $stateid.text;})?
  {$result.getTransitions().add(new Transition(source, $event.text, action, target));}
  ';'
  ;
// ... // Lexical syntax as before
// BEGIN ...
stateid : NAME ;
event : NAME ;
action : NAME ;
NAME : ('a'..'z'|'A'..'Z')+ ;
WS : [ \t\n\r]+ -> skip ;
// END ...
