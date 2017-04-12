# Language _DDL (Data Definition Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DDL)**

A SQL DDL-like data definition language for relational schemas.

## Purposes
* Data definition

## Links

## Representations
* ddl(text)
* ddl(term)

## References
* membership(ddl(text),eglAcceptor(ddlAbstract: (~>)),['languages/DDL/cs.term','languages/DDL/ls.term'])
* function(parse,[ddl(text)],[ddl(term)],eglParser(ddlAbstract: (~>)),['languages/DDL/cs.term','languages/DDL/ls.term'])
* function(parse,[ddl(text)],[ddl(term)],eglParser(ddlAbstract: (~>)),['languages/DDL/cs.term','languages/DDL/ls.term'])
* membership(ddl(term),eslLanguage,['languages/DDL/as.term'])
* function(applyDiff,[mmdl(term),ddl(term)],[ddl(term)],mmdlToDdl:apply,[])
* function(applyDiff,[mmdl(term),ddl(term)],[ddl(term)],mmdlToDdl:apply,[])
* function(mmlToDdl,[ddl(mml(term))],[ddl(term)],mmlToDdl:classesToTables,[])

## Elements
* [languages/FRL/dd.ddl](../files/languages-FRL-dd.ddl.md)
* [languages/FRL/dd.term](../files/languages-FRL-dd.term.md)
* [languages/FRL/FRL2/dd.ddl](../files/languages-FRL-FRL2-dd.ddl.md)
* [languages/FRL/FRL2/dd.term](../files/languages-FRL-FRL2-dd.term.md)
