# File _languages/FSML/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/cs.egl)**
```
fsm : {state}* ;
state : {'initial'}? 'state' stateid '{' {transition}* '}' ;
transition : event {'/' action}? {'->' stateid}? ';' ;
stateid : name ;
event : name ;
action : name ;
```
