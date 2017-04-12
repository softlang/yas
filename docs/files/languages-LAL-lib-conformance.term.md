# File _languages/LAL/lib/conformance.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance.term)**
```
[reuse([language],[]),reuse([language],[ ('L','DefL'), ('Any','DefAny')]),constant(defL,ref('DefL')),relation(conformsTo,[ref('Any'),ref('DefL')]),axiom([],forall(bindv(x),ref('Any'),iff(element(var(x),ref('L')),relapp(conformsTo,[var(x),var(defL)]))))].
```
