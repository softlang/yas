# File _languages/EGL/Haskell/Language/EGL/Sample.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/Haskell/Language/EGL/Sample.hs)**
```
-- BEGIN ...
module Language.EGL.Sample where
import Language.EGL.Syntax
-- END ...
sampleGrammar :: Grammar
sampleGrammar = [
  (Nothing,"fsm",[Star [N "state"]]),
  (Nothing,"state",[Option [T "initial"],T "state",N "stateid",T "{",Star [N "transition"],T "}"]),
  (Nothing,"transition",[N "event",Option [T "/",N "action"],Option [T "->",N "stateid"],T ";"]),
  (Nothing,"stateid",[N "name"]),
  (Nothing,"event",[N "name"]),
  (Nothing,"action",[N "name"])
 ]
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/EGL/Haskell/Language/EGL/Sample.hs',haskell(text))
