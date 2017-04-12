# File _languages/LAL/lib/selection.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/selection.term)**
```
[reuse([language],[]),reuse([language],[ ('L','QL'), ('Any','QAny')]),reuse([composition],[]),function(select,[ref('QL'),ref('L')],partial,star(ref('L'))),axiom([],forall(bindv(q),ref('QL'),forall(bindv(x),ref('L'),forall(bindv(ys),star(ref('L')),ifthen(eq(funapp(select,[var(q),var(x)]),var(ys)),foreach(bindv(y),var(ys),relapp(partOfStar,[var(y),var(x)])))))))].
```
