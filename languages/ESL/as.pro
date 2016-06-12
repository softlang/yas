% An applied signature
appliedSignature(Decls) :-

  require(
    appliedTermExpected,
    appliedTerm(Decls)),

  % No confusion of symbols and types
  \+ (
    member(symbol(_, _, Sort), Decls),
    member(type(Sort, _), Decls)
  ),

  % No double declarations of symbols
  \+ (
    member(symbol(Symbol, Arguments1, Result1), Decls),
    member(symbol(Symbol, Arguments2, Result2), Decls),
    \+ (
      Arguments1 == Arguments2,
      Result1 == Result2
    )
  ),

  % No double declarations of types
  \+ (
    member(type(Sort, Type1), Decls),
    member(type(Sort, Type2), Decls),
    \+ Type1 == Type2
  ),

  % Per-declaration well-formedness
  map(appliedDecl, Decls).

% A declaration of a symbol
appliedDecl(symbol(_, Arguments, Result)) :-
  map(appliedType, Arguments),
  appliedSort(Result).

% A declaration of a type
appliedDecl(type(Sort, Type)) :-
  appliedSort(Sort),
  appliedType(Type).

% Some sorts are reserved as "primitive types"
appliedSort(Sort) :-
  \+ member(Sort, [
       boolean, 
       integer, 
       float, 
       string, 
       term
     ]).

% An applied term type 
appliedType(boolean).
appliedType(integer).
appliedType(float).
appliedType(string).
appliedType(term).
appliedType(sort(Sort)) :- 
  appliedSort(Sort).
appliedType(star(Type)) :- 
  appliedType(Type).
appliedType(plus(Type)) :- 
  appliedType(Type).
appliedType(option(Type)) :- 
  appliedType(Type).
appliedType(tuple(Types)) :-
  map(appliedType, Types).
appliedType(option(Type)) :- 
  appliedType(Type).
