# Language _TBL (Tree-based Buddy Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL)**

A trivial ontology-oriented language for representing collections of persons and their buddy relationships with a tree-based abstract syntax.

## Purposes
_None_

## Links
* variationOf: [GBL](http://softlang.github.io/yas/languages/GBL.html)

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
* [languages/TBL/samples/empty.tbl](../files/languages-TBL-samples-empty.tbl.md)
* [languages/TBL/samples/notOk1.tbl](../files/languages-TBL-samples-notOk1.tbl.md)
* [languages/TBL/samples/notOk2.tbl](../files/languages-TBL-samples-notOk2.tbl.md)
* [languages/TBL/samples/singleton.tbl](../files/languages-TBL-samples-singleton.tbl.md)
* [languages/TBL/samples/small-world.tbl](../files/languages-TBL-samples-small-world.tbl.md)
* [languages/TBL/samples/empty.term](../files/languages-TBL-samples-empty.term.md)
* [languages/TBL/samples/singleton.term](../files/languages-TBL-samples-singleton.term.md)
* [languages/TBL/samples/small-world.term](../files/languages-TBL-samples-small-world.term.md)
* [languages/TBL/samples/notOk1.term](../files/languages-TBL-samples-notOk1.term.md)
* [languages/TBL/samples/notOk2.term](../files/languages-TBL-samples-notOk2.term.md)
* [languages/TBL/samples/empty.term](../files/languages-TBL-samples-empty.term.md)
* [languages/TBL/samples/singleton.term](../files/languages-TBL-samples-singleton.term.md)
* [languages/TBL/samples/small-world.term](../files/languages-TBL-samples-small-world.term.md)
