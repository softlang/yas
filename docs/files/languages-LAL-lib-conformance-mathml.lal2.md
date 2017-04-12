# File _languages/LAL/lib/conformance/mathml.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance/mathml.lal2)**
```
sort XML
sort MathML <= XML
sort XSD <= XML
constant MathMLSchema : XSD
relation conformsTo : XML # XSD
axiom {
 forall x <- XML.
  (x <- MathML) <=> conformsTo(x, MathMLSchema)
}
link XML to 'https://www.w3.org/XML'
link XSD to 'https://www.w3.org/XML/Schema'
link MathML to 'https://www.w3.org/TR/MathML3'
link MathMLSchema to 'https://www.w3.org/Math/XMLSchema'
```
