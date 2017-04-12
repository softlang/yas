# File _languages/LAL/lib/conformance/mathml.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance/mathml.term2)**
```
[sort('XML',[]),sort('MathML',['XML']),sort('XSD',['XML']),constant('MathMLSchema',ref('XSD')),relation(conformsTo,[ref('XML'),ref('XSD')]),axiom([],forall(bindv(x),ref('XML'),iff(element(var(x),ref('MathML')),relapp(conformsTo,[var(x),var('MathMLSchema')])))),link('XML','https://www.w3.org/XML'),link('XSD','https://www.w3.org/XML/Schema'),link('MathML','https://www.w3.org/TR/MathML3'),link('MathMLSchema','https://www.w3.org/Math/XMLSchema')].
```
