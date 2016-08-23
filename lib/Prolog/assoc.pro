% Look up first value in association list
lookup1st(K, [(K, V)|_], V).
lookup1st(K1, [(K2, _)|R], V) :-
  \+ K1 = K2,
  lookup1st(K1, R, V).

% Look up any value in association list
lookup(K, [(K, V)|_], V).
lookup(K, [_|R], V) :- lookup(K, R, V).

% Prepend to an association list
prepend(K, V, L, [(K, V)|L]).

% Insert into association list
insert(K, V, [], [(K, V)]).
insert(K1, V1, [(K2, V2)|R1], [(K2, V2)|R2]) :-
  \+ K1 = K2,
  insert(K1, V1, R1, R2).

% Update association list
update(K, V, [(K, _)|R], [(K, V)|R]).
update(K1, V1, [(K2, V2)|R1], [(K2, V2)|R2]) :-
  \+ K1 = K2,
  update(K1, V1, R1, R2).
  
% Insert into / update association list
insupd(K, V, [], [(K, V)]).
insupd(K, V, [(K, _)|R], [(K, V)|R]).
insupd(K1, V1, [(K2, V2)|R1], [(K2, V2)|R2]) :-
  \+ K1 = K2,
  insupd(K1, V1, R1, R2).

% Remove first value in association list
remove1st(K, [(K, _)|R], R).
remove1st(K1, [(K2, V)|R1], [(K2, V)|R2]) :-
  \+ K1 = K2,
  remove1st(K1, R1, R2).
