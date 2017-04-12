# Language _BSTL (Basic Signature Transformation Language)_
A trivial transformation language for coupled transformations on BSL signatures and conformant terms.

## Purposes
_None_

## Links
* dependsOn: [BSL](http://softlang.github.io/yas/languages/BSL.html)
* dependsOn: [Term](http://softlang.github.io/yas/languages/Term.html)

## Representations
* bstl(term)

## References
* membership(bstl(term),eslLanguage,['languages/BSTL/as.term'])
* function(interpret,[bstl(term),bsl(term)],[bsl(term)],bstlSig:interpret,[])
* function(interpret,[bstl(term),term],[term],bstlTerm:interpret,[])

## Elements
* [languages/BSTL/tests/trafo1.term](../../languages/BSTL/tests/trafo1.term)
