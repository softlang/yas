# File _languages/FRL/FRL2/mm.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FRL/FRL2/mm.term)**
```
[class(false,family,[],[ (value,name,atom,one), (part,members,person,star)]),class(false,person,[],[ (value,firstName,atom,one), (value,lastName,atom,one), (value,emailAddresses,atom,star), (reference,closestFriend,person,option)]),datatype(atom)].
```

## Languages
* [MML](../languages/MML.md)

## References
* mapsTo(diff,['languages/FRL/mm.term','languages/FRL/FRL2/mm.term'],['languages/FRL/termdiff.term'])
* mapsTo(applyDiff,['languages/FRL/termdiff.term','languages/FRL/mm.term'],['languages/FRL/FRL2/mm.term'])
* mapsTo(applyDiff,['languages/FRL/terminvdiff.term','languages/FRL/FRL2/mm.term'],['languages/FRL/mm.term'])
* mapsTo(diff,['languages/FRL/mm.term','languages/FRL/FRL2/mm.term'],['languages/FRL/mmdiff.term'])
* mapsTo(applyDiff,['languages/FRL/mmdiff.term','languages/FRL/mm.term'],['languages/FRL/FRL2/mm.term'])
* mapsTo(applyDiff,['languages/FRL/mminvdiff.term','languages/FRL/FRL2/mm.term'],['languages/FRL/mm.term'])
* elementOf('languages/FRL/FRL2/mm.term',ddl(mml(term)))
* elementOf('languages/FRL/FRL2/mm.term',mml(term))
* mapsTo(parse,['languages/FRL/FRL2/mm.mml'],['languages/FRL/FRL2/mm.term'])
* mapsTo(resolve,['languages/FRL/FRL2/mm.term'],['languages/FRL/FRL2/mm.graph'])
* mapsTo(mmlToDdl,['languages/FRL/FRL2/mm.term'],['languages/FRL/FRL2/dd.term'])
