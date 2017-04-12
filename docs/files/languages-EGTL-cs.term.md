# File _languages/EGTL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/cs.term)**
```
[ ([sequ],trafos,[star([n(trafo)])]), ([renameT],trafo,[t(rename),n(terminal),t(to),n(terminal),t(;)]), ([renameN],trafo,[t(rename),n(nonterminal),t(to),n(nonterminal),t(;)]), ([generalize],trafo,[t(generalize),n(rule),t(to),n(rule)]), ([specialize],trafo,[t(specialize),n(rule),t(to),n(rule)]), ([add],trafo,[t(add),n(rule)]), ([remove],trafo,[t(remove),n(rule)]), ([],rule,[option([t('['),n(label),t(']')]),n(nonterminal),t(:),n(gsymbols),t(;)]), ([],gsymbols,[star([n(gsymbol)])]), ([t],gsymbol,[n(terminal)]), ([n],gsymbol,[n(nonterminal)]), ([star],gsymbol,[t('{'),n(gsymbols),t('}'),t(*)]), ([plus],gsymbol,[t('{'),n(gsymbols),t('}'),t(+)]), ([option],gsymbol,[t('{'),n(gsymbols),t('}'),t(?)]), ([not],gsymbol,[t('{'),n(gsymbols),t('}'),t(~)]), ([],label,[n(name)]), ([],terminal,[n(qstring)]), ([],nonterminal,[n(name)])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(egtl(text),eglAcceptor(egtlAbstract: (~>)),['languages/EGTL/cs.term','languages/EGTL/ls.term'])
* function(parse,[egtl(text)],[egtl(term)],eglParser(egtlAbstract: (~>)),['languages/EGTL/cs.term','languages/EGTL/ls.term'])
* elementOf('languages/EGTL/cs.term',egl(term))
* mapsTo(parse,['languages/EGTL/cs.egl'],['languages/EGTL/cs.term'])
