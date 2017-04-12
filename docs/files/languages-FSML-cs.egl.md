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

## Languages
* [EGL](../languages/EGL.md)

## References
* elementOf('languages/FSML/cs.egl',egl(text))
* mapsTo(parse,['languages/FSML/cs.egl'],['languages/FSML/cs.term'])
