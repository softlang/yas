:- module(elqqParser, []).

expr(Term2) -->
    string_without([], Codes),
    { eglParser(
	      elqqAbstract:(~>),
	      'languages/EL/qq/cs.term',
	      'languages/EL/qq/ls.term',
	      Codes,
	      Term1
	  ),
      metavar(Term1, Term2)
    }.

metavar(metavar(X), Y) :-
    logvars:get(elqq, X, Y).
metavar(X, Y) :-
    X =.. [F|Xs],
    map(elqqParser:metavar, Xs, Ys),
    Y =.. [F|Ys].
