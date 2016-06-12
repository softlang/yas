% Page for constructing a new model
new_page(Request) :-

  % Start a new session
  newSession(S),

  % URL parsing
  member(search(L), Request),
  member((metamodel=MmName), L),
  member((class=CName), L),

  % Object creation
  metamodel(MmName, MM),
  newObject(MM, CName, Obj),
  initSession(S, MmName, Obj),

  % Page rendering
  editObject(S).
