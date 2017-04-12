# File _languages/DGL/sample.dgl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DGL/sample.dgl)**
```
digraph G {
  a [label="A", shape=ellipse, style=filled]
  b [label="B", shape=box]
  a -> b [label=" a2b "]
  b -> b
}
```

## Languages
* [DGL](../languages/DGL.md)

## References
* elementOf('languages/DGL/sample.dgl',dgl(text))
* mapsTo(pp,['languages/DGL/sample.ppl'],['languages/DGL/sample.dgl'])
