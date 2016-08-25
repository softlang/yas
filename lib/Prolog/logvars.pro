% (C) 2016 Ralf Laemmel
:- module(logvars, []).

/*
get(+S, +N, -V): Retrieve the value V of the global variable named N
and "scoped" by the global variable S. The variable N is
"automatically" created with a fresh logical variable V as initial
value.
*/

get(S, N, V) :-
    atom(S),
    atom(N),
    ( nb_current(S, _) ->
	  true;
          nb_setval(S, _) ),
    nb_getval(S, (Ns, Vs)),
    varnth0(Pos, Ns, N),
    nth0(Pos, Vs, V).	  

/*
varnth0(-Pos, ?Ns, +N): given a list Ns of atoms with a variable tail,
find the name N in Ns or, if not present, unify the first variable
position of Ns with N, and return the position as Pos. This is a
helper for get/3.
*/

varnth0(Pos1, [N1|Ns], N2) :-
    atom(N1),
    atom(N2),
    ( N1 == N2 ->
	  Pos1 = 0;
          varnth0(Pos2, Ns, N2),
          Pos1 is Pos2 + 1 ).
varnth0(0, [N1|_], N2) :-
    var(N1),
    atom(N2),
    N1 = N2.
