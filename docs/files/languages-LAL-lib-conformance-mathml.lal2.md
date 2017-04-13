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

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/conformance/mathml.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/conformance/mathml.term2'],['languages/LAL/lib/conformance/mathml.lal2'])
* mapsTo(parse,['languages/LAL/lib/conformance/mathml.lal2'],['languages/LAL/lib/conformance/mathml.term2'])
