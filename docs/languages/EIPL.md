# Language _EIPL (Extended Imperative Programming Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL)**

A small extension of the trivial imperative programming language BIPL to provide unparameterized procedures in nested scopes.

## Purposes
* Imperative programming

## Links
* supersetOf: [BIPL](http://softlang.github.io/yas/languages/BIPL.html)

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
* [languages/EIPL/sample.eipl](../files/languages-EIPL-sample.eipl.md)
* [languages/EIPL/sample.term](../files/languages-EIPL-sample.term.md)
* [languages/EIPL/sample.term](../files/languages-EIPL-sample.term.md)
* [languages/EIPL/tests/div.eipl](../files/languages-EIPL-tests-div.eipl.md)
* [languages/EIPL/tests/missing-proc-dec.eipl](../files/languages-EIPL-tests-missing-proc-dec.eipl.md)
* [languages/EIPL/tests/missing-var-dec.eipl](../files/languages-EIPL-tests-missing-var-dec.eipl.md)
* [languages/EIPL/tests/proc-clash.eipl](../files/languages-EIPL-tests-proc-clash.eipl.md)
* [languages/EIPL/tests/var-clash.eipl](../files/languages-EIPL-tests-var-clash.eipl.md)
* [languages/EIPL/tests/var-clash.term](../files/languages-EIPL-tests-var-clash.term.md)
* [languages/EIPL/tests/proc-clash.term](../files/languages-EIPL-tests-proc-clash.term.md)
* [languages/EIPL/tests/missing-var-dec.term](../files/languages-EIPL-tests-missing-var-dec.term.md)
* [languages/EIPL/tests/missing-proc-dec.term](../files/languages-EIPL-tests-missing-proc-dec.term.md)
