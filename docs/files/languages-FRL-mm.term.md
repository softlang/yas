# File _languages/FRL/mm.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FRL/mm.term)**
```
[class(false,family,[],[ (value,name,atom,one), (part,members,person,star)]),class(false,person,[],[ (value,firstName,atom,one), (value,emailAddresses,atom,star), (reference,closestFriend,person,option)]),datatype(atom)].
```

## Languages
* [MML](../languages/MML.md) (mml(term))

## References
* elementOf('languages/FRL/mm.term',mml(term))
* mapsTo(parse,['languages/FRL/mm.mml'],['languages/FRL/mm.term'])
* mapsTo(resolve,['languages/FRL/mm.term'],['languages/FRL/mm.graph'])
* mapsTo(diff,['languages/FRL/mm.term','languages/FRL/FRL2/mm.term'],['languages/FRL/termdiff.term'])
* mapsTo(applyDiff,['languages/FRL/termdiff.term','languages/FRL/mm.term'],['languages/FRL/FRL2/mm.term'])
* mapsTo(applyDiff,['languages/FRL/terminvdiff.term','languages/FRL/FRL2/mm.term'],['languages/FRL/mm.term'])
* mapsTo(diff,['languages/FRL/mm.term','languages/FRL/FRL2/mm.term'],['languages/FRL/mmdiff.term'])
* mapsTo(applyDiff,['languages/FRL/mmdiff.term','languages/FRL/mm.term'],['languages/FRL/FRL2/mm.term'])
* mapsTo(applyDiff,['languages/FRL/mminvdiff.term','languages/FRL/FRL2/mm.term'],['languages/FRL/mm.term'])
* elementOf('languages/FRL/mm.term',ddl(mml(term)))
* mapsTo(mmlToDdl,['languages/FRL/mm.term'],['languages/FRL/dd.term'])
