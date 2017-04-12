# File _languages/FSML/tests/sampleRenamed.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/sampleRenamed.term)**
```
[ (true,closed,[ (ticket,[collect],open), (pass,[alarm],exception)]), (false,open,[ (ticket,[eject],open), (pass,[],closed)]), (false,exception,[ (ticket,[eject],exception), (pass,[],exception), (mute,[],exception), (release,[],closed)])].
```

## Languages
* [FSML](../languages/FSML.md)
* [FSML](../languages/FSML.md)

## References
* elementOf('languages/FSML/tests/sampleRenamed.term',fsml(term))
* mapsTo(parse,['languages/FSML/tests/sampleRenamed.fsml'],['languages/FSML/tests/sampleRenamed.term'])
* elementOf('languages/FSML/tests/sampleRenamed.term',ok(fsml(term)))
* mapsTo(rename,['languages/FSML/tests/renaming.term','languages/FSML/sample.term'],['languages/FSML/tests/sampleRenamed.term'])
