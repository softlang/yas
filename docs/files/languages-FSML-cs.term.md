# File _languages/FSML/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/cs.term)**
```
[ ([],fsm,[star([n(state)])]), ([],state,[option([t(initial)]),t(state),n(stateid),t('{'),star([n(transition)]),t('}')]), ([],transition,[n(event),option([t(/),n(action)]),option([t(->),n(stateid)]),t(;)]), ([],stateid,[n(name)]), ([],event,[n(name)]), ([],action,[n(name)])].
```
