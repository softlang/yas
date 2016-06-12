inputsOfFsm(Fsm, Text) :-

  % Collect input values
  findall(
    I,
    (
      member((_, _, Ts), Fsm),
      member((I, _, _), Ts)
    ),
    Is1),

  % Establish uniquness of values
  list_to_set(Is1, Is2),

  % Render enum type
  ppJavaDecl(enum(public, 'Input', Is2), Text).
