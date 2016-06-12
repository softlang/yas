% Apply symbol declaration
wellTypedTerm(Decls, sort(Result), Term) :-
  \+ (list(Term); tuple(Term)),
  Term =.. [FSym|Terms],
  member(symbol(FSym, Args, Result), Decls),
  map(wellTypedTerm(Decls), Args, Terms).

% Apply type declaration
wellTypedTerm(Decls, sort(Sort), Term) :-
  member(type(Sort, Type), Decls),
  wellTypedTerm(Decls, Type, Term).

% Tesst for primitive data types
wellTypedTerm(_, boolean, Term) :- boolean(Term).
wellTypedTerm(_, integer, Term) :- integer(Term).
wellTypedTerm(_, float, Term) :- float(Term).
wellTypedTerm(_, string, Term) :- atom(Term).
wellTypedTerm(_, term, _).

% Test for lists
wellTypedTerm(Decls, star(Type), Terms) :-
  map(wellTypedTerm(Decls, Type), Terms).
wellTypedTerm(Decls, plus(Type), Terms) :-
  Terms \= [],
  map(wellTypedTerm(Decls, Type), Terms).

% Test for options
wellTypedTerm(Decls, option(Type), Terms) :-
  ( Terms = []; Terms = [_] ),
  map(wellTypedTerm(Decls, Type), Terms).

% Base case for tuples
wellTypedTerm(Decls, tuple([Type]), Term) :-
  wellTypedTerm(Decls, Type, Term).

% Step case for tuples
wellTypedTerm(Decls, tuple([Type|Types]), (Term, Terms)) :-
  Types \= [],
  wellTypedTerm(Decls, Type, Term),
  wellTypedTerm(Decls, tuple(Types), Terms).
