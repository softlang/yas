# File _languages/FSML/sample.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/sample.fsml)**
```
initial state locked {
  ticket/collect -> unlocked;
  pass/alarm -> exception;
}
state unlocked {
  ticket/eject;
  pass -> locked;
}
state exception {
  ticket/eject;
  pass;
  mute;
  release -> locked;
}
```

## Languages
* [FSML](../languages/FSML.md) (fsml(text))

## References
* elementOf('languages/FSML/sample.fsml',fsml(text))
* mapsTo(parse,['languages/FSML/sample.fsml'],['languages/FSML/sample.term'])
* mapsTo(parse,['languages/FSML/sample.fsml'],['languages/FSML/Python/sample.json'])
