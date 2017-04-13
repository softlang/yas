# File _languages/FRL/FRL2/dd.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FRL/FRL2/dd.term)**
```
[ (family,[ (objectId,integer,[notNull,primaryKey]), (name,varchar(42),[notNull])]), (person,[ (objectId,integer,[notNull,primaryKey]), (firstName,varchar(42),[notNull]), (lastName,varchar(42),[notNull]), (closestFriend,integer,[foreignKey(person,objectId)])]), (family_members,[ (familyId,integer,[notNull,foreignKey(family,objectId)]), (members,integer,[notNull,foreignKey(person,objectId)])]), (person_emailAddresses,[ (personId,integer,[notNull,foreignKey(person,objectId)]), (emailAddresses,varchar(42),[notNull])])].
```

## Languages
* [DDL](../languages/DDL.md) (ddl(term))

## References
* mapsTo(applyDiff,['languages/FRL/mmdiff.term','languages/FRL/dd.term'],['languages/FRL/FRL2/dd.term'])
* elementOf('languages/FRL/FRL2/dd.term',ddl(term))
* mapsTo(parse,['languages/FRL/FRL2/dd.ddl'],['languages/FRL/FRL2/dd.term'])
* mapsTo(mmlToDdl,['languages/FRL/FRL2/mm.term'],['languages/FRL/FRL2/dd.term'])
