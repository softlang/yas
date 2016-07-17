% Run the megamodel
ueberRun :-
  findall(D, declaration(D), Ds),
  initTesting,
  ueberReport:report(Ds),
  ( mode(verbose) ->
       format('~nMegamodel well-formedness:~n', []),
	map(ueberOk(Ds), Ds)
      ; map(try(ueberOk:ok(Ds)), Ds) ),
  ( mode(verbose) ->
        format('~nMegamodel verification:~n', []),
	map(ueberVerify(Ds), Ds)
      ; map(try(callVerify(Ds)), Ds) ),
  ( problem(_, _) ->
        format('~nMegamodel problems:~n', []),
	findall((M, Ps), problem(M, Ps), X),
	map(formatProblem, X),
	abort
  ; true ).

:- dynamic problem/2.

formatProblem((M, Ps)) :- write(' * '), format(M, Ps), nl.

% Check a declaration
ueberOk(Ds, D) :-
  format(' * ~q: ',[D]),
  flush_output,
  once(
    ( ueberOk:ok(Ds, D) ->
        format('OK~n',[])
      ; 
        format('FAIL~n',[]),
        report('~w: NOT OK.', [D])
    )
  ).

% Verify a declaration with reporting
ueberVerify(Ds, D) :-
  format(' * ~q: ',[D]),
  flush_output,
  once(
    ( callVerify(Ds, D) ->
        format('VERIFIED~n',[])
      ; 
        format('FAIL~n',[]),
        report('~w: UNVERIFIED.', [D])
    )
  ).


callVerify(Ds, D) :-
    nb_setval(current, D),
    ueberVerify:verify(Ds, D).
		  
% Report a problem on a failing goal
assume(G, M, Ps) :- G -> true; report(M, Ps), fail.

% Report a problem
report(M, Ps) :-
  problem(M, Ps) -> 
      true
    ; assertz(problem(M, Ps)).
