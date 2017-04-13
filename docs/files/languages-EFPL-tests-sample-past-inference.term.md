# File _languages/EFPL/tests/sample-past-inference.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/tests/sample-past-inference.term)**
```
[ (dec,[funtype(inttype,inttype)],[x],binary(sub,name(x),intconst(1))), (factorial,[funtype(inttype,inttype)],[x],if(binary(eq,name(x),intconst(0)),intconst(1),binary(mul,name(x),apply(name(factorial),[apply(name(dec),[name(x)])])))), (twice,[funtype(funtype(typevar(a),typevar(a)),funtype(typevar(a),typevar(a)))],[f,x],apply(name(f),[apply(name(f),[name(x)])]))],apply(name(twice),[name(factorial),intconst(3)]).
```

## Languages
* [EFPL](../languages/EFPL.md) (ok(efpl(term)))
* [EFPL](../languages/EFPL.md) (efpl(term))

## References
* elementOf('languages/EFPL/tests/sample-past-inference.term',ok(efpl(term)))
* mapsTo(infer,['languages/EFPL/tests/sample.term'],['languages/EFPL/tests/sample-past-inference.term'])
* mapsTo(bigstep,['languages/EFPL/tests/sample-past-inference.term'],['languages/EFPL/Prolog/sample.value'])
* elementOf('languages/EFPL/tests/sample-past-inference.term',efpl(term))
* mapsTo(parse,['languages/EFPL/tests/sample-past-inference.efpl'],['languages/EFPL/tests/sample-past-inference.term'])
