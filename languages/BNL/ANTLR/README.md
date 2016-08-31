EBNF.g shows an EBNF for binary numbers.

BNF.g shows a BNF for binary numbers.

A binary-to-decimal number conversion has to deal with ANTLR's limitations:

* The underlying context-free grammar must not be left-recursive.
* Essentially, only L- and S-attributed grammars are feasible.

However, ANTLR also provides some conveniences in the attribute grammar context:

* One can easily model attribution even when using EBNF.
* One can model local attributes.

As a result, an encoding of the conversion is favored such that bit sequences before and after "." are treated differently in terms of the semantic action. The encoding is really simple, but it is quite removed from the original specification by Knuth or a straightforward S-attributed encoding (which preferably would rely on left recursion).

See AttributesForEBNF.g for the actual conversion.
