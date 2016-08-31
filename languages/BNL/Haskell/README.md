Module Number.hs defines an abstract syntax for binary numbers.

Module Conversion.hs defines a binary-to-decimal number conversion.

Laziness is essential for this implementation as the synthesized attribute for length is passed back into the computation as the initial value for the bit position; see the function number (corresponding to all semantic rules for the nonterminal number).
