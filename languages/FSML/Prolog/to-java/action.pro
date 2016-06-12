actionsOfFsm(Fsm, Text) :-

  % Find all action names
  findall(
    A,
    (
      member((_, _, Ts), Fsm),
      member((_, [A], _), Ts)
    ),
    As1),

  % Establish uniqueness of names
  list_to_set(As1, As2),

  % Render enum type
  ppJavaDecl(enum(public, 'Action', As2), Text).

