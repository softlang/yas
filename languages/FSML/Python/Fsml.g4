grammar Fsml;
options {language=Python2;}
@header {
from FsmlModel import FsmlModel
}
fsm :
   {self._errHandler = BailErrorStrategy()}
   {self.model = FsmlModel()}
   statedecl* EOF
   ;
statedecl :
   {initial=False}
   ('initial' {initial=True})? 'state' stateid
   {self.model.addState(initial, $stateid.text)}
   '{' transition* '}'
   ;
transition :
   event ('/' action)? ('->' stateid)? ';'
   {self.model.addTransition($event.text, $action.text, $stateid.text)}
   ;
stateid : NAME ;
event : NAME ;
action : NAME ;
NAME : ('a'..'z'|'A'..'Z')+ ;
WS : [ \t\n\r]+ -> skip ;
