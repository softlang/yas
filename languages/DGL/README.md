# Language _DGL (Dot-based Graph Language)_
A trivial specification language for graphs that may be rendered eventually with the Graphviz tool.

## Purposes
* Graph representation

## Links
* subsetOf: [DOT](http://softlang.github.io/yas/languages/DOT.html)

## Representations
* dgl(text)
* dgl(term)

## References
* membership(dgl(term),eslLanguage,['languages/DGL/as.term'])
* membership(dgl(text),succeed,[])
* function(pp,[dgl(term)],[ppl(term)],dglPp,[])
* function(fsmToDgl,[fsml(term)],[dgl(term)],fsmToDgl,[])
* function(languages,[ueber(term)],[dgl(term)],ueberGraphLanguages:graph,[])
* function(functions,[ueber(term)],[dgl(term)],ueberGraphFunctions:graph,[])

## Elements
* [languages/DGL/sample.dgl](../../languages/DGL/sample.dgl)
* [languages/DGL/sample.term](../../languages/DGL/sample.term)
* [languages/FSML/Prolog/dot/sample.dgl](../../languages/FSML/Prolog/dot/sample.dgl)
* [languages/FSML/Prolog/dot/sample.term](../../languages/FSML/Prolog/dot/sample.term)
* [languages/Ueber/functions.dgl](../../languages/Ueber/functions.dgl)
* [languages/Ueber/languages.dgl](../../languages/Ueber/languages.dgl)
* [languages/Ueber/languages.term](../../languages/Ueber/languages.term)
* [languages/Ueber/functions.term](../../languages/Ueber/functions.term)
