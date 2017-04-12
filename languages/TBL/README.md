# Language _TBL (Tree-based Buddy Language)_
A trivial ontology-oriented language for representing collections of persons and their buddy relationships with a tree-based abstract syntax.

## Purposes
_None_

## Links
* variationOf(gbl)

## Representations
* tbl(text)
* tbl(term)
* ok(tbl(term))

## References
* membership(tbl(text),eglAcceptor(tblAbstract: (~>)),['languages/TBL/cs.term','languages/TBL/ls.term'])
* function(parse,[tbl(text)],[tbl(term)],eglParser(tblAbstract: (~>)),['languages/TBL/cs.term','languages/TBL/ls.term'])
* function(parse,[tbl(text)],[tbl(term)],eglParser(tblAbstract: (~>)),['languages/TBL/cs.term','languages/TBL/ls.term'])
* membership(tbl(term),eslLanguage,['languages/TBL/as.term'])
* function(mapping,[tbl(term)],[tbl(graph(term))],tblDict: (=>),[])
* membership(ok(tbl(term)),tblOk:world,[])

## Elements
* [languages/TBL/samples/empty.tbl](../../languages/TBL/samples/empty.tbl)
* [languages/TBL/samples/notOk1.tbl](../../languages/TBL/samples/notOk1.tbl)
* [languages/TBL/samples/notOk2.tbl](../../languages/TBL/samples/notOk2.tbl)
* [languages/TBL/samples/singleton.tbl](../../languages/TBL/samples/singleton.tbl)
* [languages/TBL/samples/small-world.tbl](../../languages/TBL/samples/small-world.tbl)
* [languages/TBL/samples/empty.term](../../languages/TBL/samples/empty.term)
* [languages/TBL/samples/singleton.term](../../languages/TBL/samples/singleton.term)
* [languages/TBL/samples/small-world.term](../../languages/TBL/samples/small-world.term)
* [languages/TBL/samples/notOk1.term](../../languages/TBL/samples/notOk1.term)
* [languages/TBL/samples/notOk2.term](../../languages/TBL/samples/notOk2.term)
* [languages/TBL/samples/empty.term](../../languages/TBL/samples/empty.term)
* [languages/TBL/samples/singleton.term](../../languages/TBL/samples/singleton.term)
* [languages/TBL/samples/small-world.term](../../languages/TBL/samples/small-world.term)
