# Language _EIPL (Extended Imperative Programming Language)_
A small extension of the trivial imperative programming language BIPL to provide unparameterized procedures in nested scopes.

## Purposes
* Imperative programming

## Links
* supersetOf(bipl)

## Representations
* eipl(text)
* eipl(term)
* ok(eipl(term))

## References
* membership(eipl(text),eglAcceptor(eiplAbstract: (~>)),['languages/EIPL/cs.term','languages/EIPL/ls.term'])
* function(parse,[eipl(text)],[eipl(term)],eglParser(eiplAbstract: (~>)),['languages/EIPL/cs.term','languages/EIPL/ls.term'])
* function(parse,[eipl(text)],[eipl(term)],eglParser(eiplAbstract: (~>)),['languages/EIPL/cs.term','languages/EIPL/ls.term'])
* membership(eipl(term),eslLanguage,['languages/EIPL/as.term'])
* membership(ok(eipl(term)),eiplTyping:main,[])
* function(executeDynamic,[eipl(term)],[term],eiplDynamic:main,[])
* function(executeMixed,[eipl(term)],[term],eiplMixed:main,[])
* function(executeStatic,[eipl(term)],[term],eiplStatic:main,[])

## Elements
* [languages/EIPL/sample.eipl](../../languages/EIPL/sample.eipl)
* [languages/EIPL/sample.term](../../languages/EIPL/sample.term)
* [languages/EIPL/sample.term](../../languages/EIPL/sample.term)
* [languages/EIPL/tests/div.eipl](../../languages/EIPL/tests/div.eipl)
* [languages/EIPL/tests/missing-proc-dec.eipl](../../languages/EIPL/tests/missing-proc-dec.eipl)
* [languages/EIPL/tests/missing-var-dec.eipl](../../languages/EIPL/tests/missing-var-dec.eipl)
* [languages/EIPL/tests/proc-clash.eipl](../../languages/EIPL/tests/proc-clash.eipl)
* [languages/EIPL/tests/var-clash.eipl](../../languages/EIPL/tests/var-clash.eipl)
* [languages/EIPL/tests/var-clash.term](../../languages/EIPL/tests/var-clash.term)
* [languages/EIPL/tests/proc-clash.term](../../languages/EIPL/tests/proc-clash.term)
* [languages/EIPL/tests/missing-var-dec.term](../../languages/EIPL/tests/missing-var-dec.term)
* [languages/EIPL/tests/missing-proc-dec.term](../../languages/EIPL/tests/missing-proc-dec.term)
