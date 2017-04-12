# Language _MMDL (MetaModel Difference Language)_
A representation format for metamodel-based term differences.

## Purposes
* Model differencing

## Links

## Representations
* mmdl(term)

## References
* membership(mmdl(term),eslLanguage,['languages/MMDL/as.term'])
* function(diff,[term,term],[mmdl(term)],mmdlDiff:diff,[])
* function(applyDiff,[mmdl(term),mml(term)],[mml(term)],mmdlApply:apply,[])
* function(invDiff,[mmdl(term)],[mmdl(term)],mmdlInv:inv,[])
* function(invDiff,[mmdl(term)],[mmdl(term)],mmdlInv:inv,[])
* function(applyDiff,[mmdl(term),ddl(term)],[ddl(term)],mmdlToDdl:apply,[])

## Elements
* [languages/FRL/mmdiff.term](../../languages/FRL/mmdiff.term)
* [languages/FRL/mminvdiff.term](../../languages/FRL/mminvdiff.term)
