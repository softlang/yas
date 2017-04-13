# File _languages/GBL/samples/small-world.graph_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/GBL/samples/small-world.graph)**
```
{ class : world,
  persons : [
    1 & { class : person, name : 'joe', buddy : [ #2 ] },
    2 & { class : person, name : 'bill', buddy : [ #1 ] } ] }.
```

## Languages
* [GBL](../languages/GBL.md) (gbl(graph(term)))

## References
* elementOf('languages/GBL/samples/small-world.graph',gbl(graph(term)))
* mapsTo(mapping,['languages/TBL/samples/small-world.graph'],['languages/GBL/samples/small-world.graph'])
