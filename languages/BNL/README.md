## Binary number conversion according to Knuth

* cs.bgl: Context-free grammar of binary numbers in BGL notation
* cs.dcg: Definite clause grammar of binary numbers
* conversion*.dcg: DCG-encoded attribute grammar for conversion.
* conversion*.pro: AST-based encoding for conversion.
* main.pro: some tests

## DCG encoding of the attribute grammar

### Use of CLP(R)

conversion1.dcg version uses CLP(R) for the semantic rules on number types.
Semantic rules are essentially enclosed in double braces.
The outer level of braces is for semantic rules within a DCG.
The inner level of braces is for constraints according to CLP(R).

### Use of a (trivial) solver

conversion1.dcg simply synthesizes an expression.
The expression is ground, in the end.
Thus, a solver is trivial; it computes the expression.

## Further reading

* http://en.wikipedia.org/wiki/Attribute_grammar
* https://github.com/slecourse/slecourse/tree/master/sources/attributeGrammars/knuth
