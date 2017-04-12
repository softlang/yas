# File _languages/FSML/tests/sampleRenamed.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/sampleRenamed.fsml)**
```
initial state closed {
  ticket/collect -> open;
  pass/alarm -> exception;
}
state open {
  ticket/eject;
  pass -> closed;
}
state exception {
  ticket/eject;
  pass;
  mute;
  release -> closed;
}
```

## Languages
* [FSML](../languages/FSML.md)

## References
* elementOf('languages/FSML/tests/sampleRenamed.fsml',fsml(text))
* mapsTo(parse,['languages/FSML/tests/sampleRenamed.fsml'],['languages/FSML/tests/sampleRenamed.term'])
