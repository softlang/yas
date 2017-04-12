# File _languages/EFPL/tests/sample-past-specialization.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/tests/sample-past-specialization.term)**
```
[ (dec,[funtype(inttype,inttype)],[x],binary(sub,name(x),intconst(1))), (factorial,[funtype(inttype,inttype)],[x],if(binary(eq,name(x),intconst(0)),intconst(1),binary(mul,name(x),apply(name(factorial),[apply(name(dec),[name(x)])])))), (twice,[funtype(funtype(inttype,inttype),funtype(inttype,inttype))],[f,x],apply(name(f),[apply(name(f),[name(x)])]))],apply(name(twice),[name(factorial),intconst(3)]).
```

## Languages
* [EFPL](../languages/EFPL.md)
* [EFPL](../languages/EFPL.md)

## References
* elementOf('languages/EFPL/tests/sample-past-specialization.term',ok(efpl(term)))
* mapsTo(bigstep,['languages/EFPL/tests/sample-past-specialization.term'],['languages/EFPL/Prolog/sample.value'])
* elementOf('languages/EFPL/tests/sample-past-specialization.term',efpl(term))
* mapsTo(parse,['languages/EFPL/tests/sample-past-specialization.efpl'],['languages/EFPL/tests/sample-past-specialization.term'])
