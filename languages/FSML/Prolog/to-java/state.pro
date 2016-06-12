statesOfFsm(Fsm, Text) :-

  % Collect declared states
  findall(
    Id,
    member((_, Id, _), Fsm),
    Ids),

  % Render enum type
  ppJavaDecl(enum(public, 'State', Ids), Text).
