# File _languages/EGTL/samples/bgl2egl.egtl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/samples/bgl2egl.egtl)**
```
// Labels are mandatory in BGL to simplify CST-to-AST mapping
generalize
  rule : '[' label ']' nonterminal ':' gsymbols ';' ;
to
  rule : {'[' label ']'}? nonterminal ':' gsymbols ';' ;

// EBNF-like constructs (and negation)
add [star] gsymbol : '{' gsymbols '}' '*' ;
add [plus] gsymbol : '{' gsymbols '}' '+' ;
add [option] gsymbol : '{' gsymbols '}' '?' ;
add [not] gsymbol : '{' gsymbols '}' '~' ;
```

## Languages
* [EGTL](../languages/EGTL.md) (egtl(text))

## References
* elementOf('languages/EGTL/samples/bgl2egl.egtl',egtl(text))
* mapsTo(parse,['languages/EGTL/samples/bgl2egl.egtl'],['languages/EGTL/samples/bgl2egl.term'])
