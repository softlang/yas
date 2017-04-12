# File _languages/DDL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DDL/cs.term)**
```
[ ([],schema,[plus([n(table)])]), ([],table,[t('CREATE'),t('TABLE'),n(name),t('('),option([n(column),star([t(','),n(column)])]),t(')'),t(;)]), ([],column,[n(name),n(type),star([n(clause)])]), ([integer],type,[t('INTEGER')]), ([varchar],type,[t('VARCHAR'),t('('),n(integer),t(')')]), ([notNull],clause,[t('NOT'),t('NULL')]), ([primaryKey],clause,[t('PRIMARY'),t('KEY')]), ([foreignKey],clause,[t('FOREIGN'),t('KEY'),t('REFERENCES'),n(name),t('('),n(name),t(')')])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(ddl(text),eglAcceptor(ddlAbstract: (~>)),['languages/DDL/cs.term','languages/DDL/ls.term'])
* function(parse,[ddl(text)],[ddl(term)],eglParser(ddlAbstract: (~>)),['languages/DDL/cs.term','languages/DDL/ls.term'])
* elementOf('languages/DDL/cs.term',egl(term))
* mapsTo(parse,['languages/DDL/cs.egl'],['languages/DDL/cs.term'])
