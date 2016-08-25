% Low-level assertion checking
true(G)
 :-
    G -> true ; ( 
      format('Assertion failed: ~q.~n',[G]),
      halt(-1) 
    ).

runTests(Tests) :-
  initTesting,
  ( Tests; true ),
  reportTesting.

initTesting :-
  nb_setval(true, 0),
  nb_setval(fail, 0),
  nb_setval(problems, 0).

reportTesting :-
  nb_getval(true, Trues),
  nb_getval(fail, Fails),
  format('Test summary: OK: ~w; FAIL: ~w~n', [Trues, Fails]),

  % Producing the right exit code
  ( mode(session); 
    ( Fails > 0 ->
        halt(1)
      ; halt
    )).

% Assertion with predicate serving as reportable constraint
require(P) :-
  P =.. [C|_],
  require(C, P).

% Assertion with explicit constraint naming
require(C, P) :-
  ( P -> 
       true
     ; 
       error(C)
  ).

% Report an error
error(C) :-
  nb_getval(problems, X1),
  ( X1 == 0 -> nl; true ), 
  format('Assertion failed: ~q~n', [C]),
  X2 is X1 + 1,
  nb_setval(problems, X2),
  fail.

% Monitor test-case execution
test(Goal) :-
  require(
    testGoalUnshowable,
    showTestGoal(Goal)), 
  write(': '),
  nb_setval(problems, 0),
  ( ( applyToIO(Goal), nb_getval(problems, 0) ) ->
        write('OK'),
        nb_getval(true, Trues0),
        Trues1 is Trues0 + 1,
        nb_setval(true, Trues1)
      ;
        nb_getval(problems, X),
        write('FAIL'),
        ( X == 0 ->
              true
            ; format(' (~w failed assertions)', [X])
        ),
        nb_getval(fail, Fails0),
        Fails1 is Fails0 + 1,
        nb_setval(fail, Fails1)
  ),
  nl.

% Apply a predicate to terms to be read from / written to files.
applyToIO(Goal) :-
  Goal =.. [P|IOs],
  map(beforeApplyToIO, IOs, Terms),
  once(apply(P, Terms)),
  map(afterApplyToIO, IOs, Terms).

% Obtain input from a file
beforeApplyToIO((i(Format), File), Data) :-
  ( Format == term, readTermFile(File, Data)
  ; Format == text, readTextFile(File, Data)
  ).

% Skip output "before"
beforeApplyToIO((o(_), _, _), _).
beforeApplyToIO((o(_), File), _) :- File \= (_, _).

% Use (unify) a term as is
beforeApplyToIO((u, Term), Term).

% Skip input "after"
afterApplyToIO((i(_), _), _).

% Compare output with a file
afterApplyToIO((o(Format), File, Eq), Actual) :-
  open(File, read, Input, []),
  ( Format == term, read(Input, Expected)
  ; Format == text, read_stream_to_codes(Input, Expected)
  ),
  close(Input),
  ( 
    once(apply(Eq, [Expected, Actual])) ->
        true
      ; nl, 
        write('Expected: '), showTestData(Format, Expected), nl,
        write('Actual: '), showTestData(Format, Actual), nl,
        fail
  ).

% Auto-fill equality
afterApplyToIO((o(Format), File), Actual) :-
  File \= (_, _),
  afterApplyToIO((o(Format), File, (==)), Actual).

% Use (unify) a term as is
afterApplyToIO((u, Term), Term).

% Show test argument
showTestData(term, X) :- format('~n~q', [X]).
showTestData(text, X) :- format('~n~s', [X]).

% Show a goal for reporting purposes
showTestGoal(Goal) :-
  Goal =.. [P|Args],
  write(P),
  showTestArgs(0, Args).

showTestArgs(0, []).
showTestArgs(P, []) :-
  P > 0,
  write(')').
showTestArgs(0, [H|T]) :- 
  write('('),
  showTestArg(H),
  showTestArgs(1, T).
showTestArgs(P1, [H|T]) :- 
  P1 > 0,
  write(', '),
  showTestArg(H),
  P2 is P1 + 1,
  showTestArgs(P2, T).

showTestArg((i(_), F)) :-
  write(F), !.
showTestArg((o(_), F)) :-
  F \= (_, _),
  write(F), !.
showTestArg((o(_), F, _)) :-
  write(F), !.
showTestArg((u, T)) :-
  write(T), !.
showTestArg(T) :-
  write(T), !.
