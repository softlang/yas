# File _languages/EGL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/cs.term)**
```
[ ([],grammar,[star([n(rule)])]), ([],rule,[option([t('['),n(label),t(']')]),n(nonterminal),t(:),n(gsymbols),t(;)]), ([],gsymbols,[star([n(gsymbol)])]), ([t],gsymbol,[n(terminal)]), ([n],gsymbol,[n(nonterminal)]), ([star],gsymbol,[t('{'),n(gsymbols),t('}'),t(*)]), ([plus],gsymbol,[t('{'),n(gsymbols),t('}'),t(+)]), ([option],gsymbol,[t('{'),n(gsymbols),t('}'),t(?)]), ([not],gsymbol,[t('{'),n(gsymbols),t('}'),t(~)]), ([],label,[n(name)]), ([],terminal,[n(qstring)]), ([],nonterminal,[n(name)])].
```