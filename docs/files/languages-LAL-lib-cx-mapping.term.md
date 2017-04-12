# File _languages/LAL/lib/cx/mapping.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/mapping.term)**
```
[reuse([coupling],[]),function(mapping,[ref('L1')],total,ref('L2')),axiom([],forall(bindv(a),ref('L1'),forall(bindv(b),ref('L2'),ifthen(eq(funapp(mapping,[var(a)]),var(b)),relapp(consistent,[var(a),var(b)])))))].
```
