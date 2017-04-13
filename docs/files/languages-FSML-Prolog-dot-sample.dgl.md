# File _languages/FSML/Prolog/dot/sample.dgl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/dot/sample.dgl)**
```
digraph G {
  locked [label="locked", shape=ellipse, style=filled]
  unlocked [label="unlocked", shape=ellipse]
  exception [label="exception", shape=ellipse]
  locked -> unlocked [label=" ticket/collect "]
  locked -> exception [label=" pass/alarm "]
  unlocked -> unlocked [label=" ticket/eject "]
  unlocked -> locked [label=" pass "]
  exception -> exception [label=" ticket/eject "]
  exception -> exception [label=" pass "]
  exception -> exception [label=" mute "]
  exception -> locked [label=" release "]
}
```

## Languages
* [DGL](../languages/DGL.md) (dgl(text))

## References
* elementOf('languages/FSML/Prolog/dot/sample.dgl',dgl(text))
* mapsTo(pp,['languages/FSML/Prolog/dot/sample.ppl'],['languages/FSML/Prolog/dot/sample.dgl'])
