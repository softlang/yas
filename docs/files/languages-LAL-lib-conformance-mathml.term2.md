# File _languages/LAL/lib/conformance/mathml.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance/mathml.term2)**
```
[sort('XML',[]),sort('MathML',['XML']),sort('XSD',['XML']),constant('MathMLSchema',ref('XSD')),relation(conformsTo,[ref('XML'),ref('XSD')]),axiom([],forall(bindv(x),ref('XML'),iff(element(var(x),ref('MathML')),relapp(conformsTo,[var(x),var('MathMLSchema')])))),link('XML','https://www.w3.org/XML'),link('XSD','https://www.w3.org/XML/Schema'),link('MathML','https://www.w3.org/TR/MathML3'),link('MathMLSchema','https://www.w3.org/Math/XMLSchema')].
```

## Languages
* [LAL](../languages/LAL.md)
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/conformance/mathml.term2',lal(term))
* mapsTo(transform,['languages/LAL/lib/conformance/mathml.term'],['languages/LAL/lib/conformance/mathml.term2'])
* mapsTo(pp,['languages/LAL/lib/conformance/mathml.term2'],['languages/LAL/lib/conformance/mathml.lal2'])
* mapsTo(parse,['languages/LAL/lib/conformance/mathml.lal2'],['languages/LAL/lib/conformance/mathml.term2'])
* elementOf('languages/LAL/lib/conformance/mathml.term2',ok(lal(term)))
