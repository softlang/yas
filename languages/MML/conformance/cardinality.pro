% Conformance for "[1-1]"
cardinalityConforms(One, P, V) :-
  permute(One, [ (class, one) ]),
  apply(P, [V]).

% Conformance for "[*]"
cardinalityConforms(Star, P, V) :-
  permute(Star, [ (class, star) ]),
  apply(map(P), [V]).

% Conformance for "[0-1]"
cardinalityConforms(Option, P, V) :-
  permute(Option, [ (class, option) ]),
  option(V),
  apply(map(P), [V]).
