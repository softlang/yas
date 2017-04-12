# Language _DGL (Dot-based Graph Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DGL)**

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
* [languages/DGL/sample.dgl](../files/languages-DGL-sample.dgl.md)
* [languages/DGL/sample.term](../files/languages-DGL-sample.term.md)
* [languages/FSML/Prolog/dot/sample.dgl](../files/languages-FSML-Prolog-dot-sample.dgl.md)
* [languages/FSML/Prolog/dot/sample.term](../files/languages-FSML-Prolog-dot-sample.term.md)
* [languages/Ueber/functions.dgl](../files/languages-Ueber-functions.dgl.md)
* [languages/Ueber/languages.dgl](../files/languages-Ueber-languages.dgl.md)
* [languages/Ueber/languages.term](../files/languages-Ueber-languages.term.md)
* [languages/Ueber/functions.term](../files/languages-Ueber-functions.term.md)
