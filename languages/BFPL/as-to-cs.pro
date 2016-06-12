% Render lists of functions
ppProg(L, S) :-
  map(ppFun, L, Bs),
  pp(vlist(Bs), S).

% Render functions
ppFun(
  (Sig, N, Args, Body),
  vlist([
    B1,
    hlist([text(N), B2, text(' =')]),
    indent(indent(B3))
  ])
) :-
     ppSig(Sig, B1),
     ppArgs(Args, B2),
     ppExpr(Body, B3).

% Render function signatures
ppSig(
  (N, [Arg|Args], Res),
  hlist([
    text(N),
    text(' :: '),
    B1,
    B2,
    text(' -> '),
    B3
  ])
) :-
     ppType(Arg, B1),
     ppArgTypes(Args, B2),
     ppType(Res, B3).

% Render more argument types
ppArgTypes([], empty).
ppArgTypes(
  [Arg|Args],
  hlist(text(' -> '), B1, B2)
) :-
     ppType(Arg, B1),
     ppArgTypes(Args, B2).

% Render types
ppType(inttype, text('Int')).
ppType(booltype, text('Bool')).

% Render arguments
ppArgs([], empty).
ppArgs(
  [Arg|Args],
  indent(hbox(text(Arg), B))
) :-
     ppArgs(Args, B).

% Render constants
ppExpr(intconst(I), text(I)).
ppExpr(boolconst(true), text('True')).
ppExpr(boolconst(false), text('False')).

% Render variable names
ppExpr(name(N), text(N)).

% Render conditionals
ppExpr(
  if(E1, E2, E3),
  vbox(
    hlist([text('if'), indent(B1)]),
    indent(indent(vbox(
      hbox(text('then'), indent(B2)),
      hbox(text('else'), indent(B3))
    ))) 
  )
) :-
     ppExpr(E1, B1),
     ppExpr(E2, B2),
     ppExpr(E3, B3).

% Render operator applications
ppExpr(
  op(O, E1, E2),
  hlist([
    text('('),
    text('('),
    B0,
    text(')'),
    indent(B1),
    indent(B2),
    text(')')
  ])
) :-
     ppOp(O, B0),
     ppExpr(E1, B1),
     ppExpr(E2, B2).

ppExpr(
  apply(N, Es),
  hlist([
    text('('),
    text(N),
    B,
    text(')')
  ])
) :-
     ppArgExprs(Es, B).

% Render operators
ppOp(add, text('+')).
ppOp(sub, text('-')).
ppOp(mult, text('*')).
ppOp(eq, text('==')).

% Render argument expresssions
ppArgExprs([], empty).
ppArgExprs(
  [Arg|Args],
  indent(hbox(B1, B2))
) :-
     ppExpr(Arg, B1),
     ppArgExprs(Args, B2).
