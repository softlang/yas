% BEGIN ...
:- module(elqqQuasiQuoter, [el/4]).
% END ...
% The quasi-quotation predicate for EL(QQ)
el(Content, _Vars, _Dict, Term) :-
   phrase_from_quasi_quotation(elqqQuasiQuoter:expr(Term), Content).

% Register the quasi-quoter
:- quasi_quotation_syntax(el).

% Parse EL(QQ) expressions with EGL-based parser
expr(Term2, Content, _) :-
    string_without([], Codes, Content, _),
    eglParser(
	      elqqAbstract:(~>),
	      'languages/EL/qq/cs.term',
	      'languages/EL/qq/ls.term',
	      Codes,
	      Term1
	  ),
    metavar(Term1, Term2).

% Replace metavar/1 functors by logical variables
metavar(metavar(X), Y) :-
    logvars:get(elqq, X, Y).
metavar(X, Y) :-
    X =.. [F|Xs],
    map(elqqQuasiQuoter:metavar, Xs, Ys),
    Y =.. [F|Ys].
