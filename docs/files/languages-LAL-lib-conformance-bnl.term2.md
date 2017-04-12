# File _languages/LAL/lib/conformance/bnl.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance/bnl.term2)**
```
[sort('Text',[]),sort('BNL',['Text']),sort('BGL',['Text']),constant(bnlGrammar,ref('BGL')),relation(conformsTo,[ref('Text'),ref('BGL')]),axiom([],forall(bindv(x),ref('Text'),iff(element(var(x),ref('BNL')),relapp(conformsTo,[var(x),var(bnlGrammar)])))),link('BNL','https://github.com/softlang/yas/blob/master/languages/BNL'),link('BGL','https://github.com/softlang/yas/blob/master/languages/BGL'),link(bnlGrammar,'https://github.com/softlang/yas/blob/master/languages/BGL/cs.bgl')].
```
