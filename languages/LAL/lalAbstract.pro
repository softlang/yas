:- module(lalAbstract, []).

% Lexical mapping
name:(Char, Chars) => Atom :- name(Atom, [Char|Chars]).
url:(_, Chars, _) => Atom :- name(Atom, Chars).

% Separator lists for module names
mname:(N, Ns) => [N|Ns].

% Separator lists for names
names:(N, Ns) => [N|Ns].

% Reduction to declarations with single names
model:Ds1 => Ds2 :- singleDecls(Ds1, Ds2).

% Separator lists for optional substitutions
reuse(N, []) => reuse(N, []).
reuse(N, [Ss]) => reuse(N, Ss).
substs:(S, Ss) => [S|Ss].

% Priorities for star/1
star(TE, []) => TE.
star(TE1, [_|L]) => star(TE2) :- star(TE1, L) => TE2.

% Separator lists for types
types:(N, Ns) => [N|Ns].

% Separator lists for variables
vars:(N, Ns) => [N|Ns].
var:N => N :- atom(N).
var:(N, Ns) => [N|Ns].

% Separator lists for bindt/1
bindt(V, Vs) => bindt([V|Vs]).

% Priorities for or/2 and then/2
or(E, []) => E.
or(E1, [E2]) => or(E1, E2).
and(E, []) => E.
and(E1, [E2]) => and(E1, E2).

% Separator lists for relapp/2
relapp(N, T, Ts) => relapp(N, [T|Ts]).

% Separator lists for funapp/2
funapp(N, T, Ts) => funapp(N, [T|Ts]).

% Priorities for iff/2 and ifthen/2
ifetal(E, []) => E.
ifetal(E1, [(iff, E2)]) => iff(E1, E2).
ifetal(E1, [(ifthen, E2)]) => ifthen(E1, E2).

% Enforce quantifiers with single names
forall([V], TE, F) => forall(V, TE, F).
forall([V|Vs], TE, F1) => forall(V, TE, F2) :-
  forall(Vs, TE, F1) => F2.
exists([V], TE, F) => exists(V, TE, F).
exists([V|Vs], TE, F1) => exists(V, TE, F2) :-
  exists(Vs, TE, F1) => F2.
existsu([V], TE, F) => existsu(V, TE, F).
existsu([V|Vs], TE, F1) => existsu(V, TE, F2) :-
  existsu(Vs, TE, F1) => F2.

% Enforce declarations with single names
singleDecls([], []).
singleDecls([D|Ds1], [D|Ds2]) :-
    ( D = reuse(_, _)
    ; D = language(_, _)
    ; D = axiom(_, _)	       
    ; D = link(_, _) ),	       
    singleDecls(Ds1, Ds2).
singleDecls([relation([], _)|Ds1], Ds2) :-
    singleDecls(Ds1, Ds2).
singleDecls([relation([N|Ns], T)|Ds1], [relation(N, T)|Ds2]) :-
    singleDecls([relation(Ns, T)|Ds1], Ds2).
singleDecls([function([], _, _, _)|Ds1], Ds2) :-
    singleDecls(Ds1, Ds2).
singleDecls([function([N|Ns], T1, A, T2)|Ds1], [function(N, T1, A, T2)|Ds2]) :-
    singleDecls([function(Ns, T1, A, T2)|Ds1], Ds2).
singleDecls([constant([], _)|Ds1], Ds2) :-
    singleDecls(Ds1, Ds2).
singleDecls([constant([N|Ns], T)|Ds1], [constant(N, T)|Ds2]) :-
    singleDecls([constant(Ns, T)|Ds1], Ds2).
