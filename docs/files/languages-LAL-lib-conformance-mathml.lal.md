# File _languages/LAL/lib/conformance/mathml.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance/mathml.lal)**
```
reuse conformance [
     Any |-> XML, DefAny |-> XML,
     L |-> MathML, DefL |-> XSD, defL |-> MathMLSchema ]
link XML to 'https://www.w3.org/XML'
link XSD to 'https://www.w3.org/XML/Schema'
link MathML to 'https://www.w3.org/TR/MathML3'
link MathMLSchema to 'https://www.w3.org/Math/XMLSchema'
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/conformance/mathml.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/conformance/mathml.lal'],['languages/LAL/lib/conformance/mathml.term'])
