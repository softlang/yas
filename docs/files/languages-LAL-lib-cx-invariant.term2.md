# File _languages/LAL/lib/cx/invariant.term2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/invariant.term2)**
```
[sort('Any1',[]),sort('L1',['Any1']),sort('Any2',[]),sort('L2',['Any2']),relation(consistent,[ref('L1'),ref('L2')]),sort('XAny',[]),sort('XL',['XAny']),function(interpret,[ref('XL'),ref('L1')],partial,ref('L1')),axiom([],forall(bindv(t),ref('XL'),forall(bindv(a),ref('L1'),forall(bindv(c),ref('L1'),forall(bindv(b),ref('L2'),ifthen(and(relapp(consistent,[var(a),var(b)]),eq(funapp(interpret,[var(t),var(a)]),var(c))),relapp(consistent,[var(c),var(b)])))))))].
```