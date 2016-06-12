% Page for removing a sub-object
remove_page(Request) :-

  % URL parsing
  member(search(L), Request),
  member((session=S1), L),
  atom_number(S1, S2),
  member((id=Id1), L),
  atom_number(Id1, Id2),

  % Object creation
  retrieveSession(S2, MmName, M1), 
  metamodel(MmName, MM),
  removeObject(MM, Id2, M1, M2),
  updateSession(S2, M2),

  % Page rendering
  editObject(S2).
