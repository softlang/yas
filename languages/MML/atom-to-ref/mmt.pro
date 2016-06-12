% atomToRef at metamodel level
atomToRefMM(
  From, % Class that is referring
  To, % Class that is being referred to
  Key, % Key to be updated
  MM1, % Input metamodel
  MM2 % Output metamodel
 ) :- 
      lookupMember(From, Key, MM1, X1),
      lookup(class, X1, value),
      lookup(type, X1, #AtomId),
      getObject(MM1, AtomId, Atom),
      lookup(class, Atom, datatype),
      lookup(name, Atom, atom),
      lookupClass(To, MM1, (IdTo&_)),      
      update(class, reference, X1, X2),
      update(type, #IdTo, X2, X3),
      updateMember(From, X3, MM1, MM2).
