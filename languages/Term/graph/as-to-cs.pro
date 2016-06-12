% Render graphs
ppGraph(G, S) :-
  once(ppGraph_(text('.'), G, B)),
  pp(B, S).

% Render graphs with IDs
ppGraph_(Post, (Id & Dict), B) :-
  ppDict(
    hbox(
      text(Id),
      text(' & ')
    ), 
    Post,
    Dict,
    B).

% Render graphs without IDs
ppGraph_(Post, Dict, B) :-
  Dict \= (_ & _),
  ppDict(empty, Post, Dict, B).

% Render dictionaries
ppDict(
  Pre,
  Post,
  Dict,
  vlist([
    hbox(Pre, text('{')),
    indent(vlist(Bs)),
    hbox(text('}'), Post)
  ])
) :-
     dictToList(Dict, L),
     ppKvPairs(L, Bs).

% Render key-value pairs of dictionaries
ppKvPairs([], []).
ppKvPairs([(K,V)], [B]) :-
  ppKvPair(empty, K, V, B).
ppKvPairs([(K,V)|L], [B|Bs]) :-
  L \= [],
  ppKvPair(text(','), K, V, B),
  ppKvPairs(L, Bs).

% Render one key-value pair
ppKvPair(
  Post,
  K, 
  V,
  hlist([text(K), text(' : '), B])
) :-
     ppValue(Post, V, B).

% Render atomic values
ppValue(
  Post,
  V,
  hbox(text(V), Post)
) :-
     atomic(V).

% Render lists
ppValue(
  Post,
  L,
  vlist([
    text('['),
    indent(vlist(Bs)),
    hbox(text(']'), Post)
  ])
) :-
     list(L),
     ppList(L, Bs).

% Render (sub-) graphs
ppValue(
  Post,
  G,
  B
) :-
     graph(G),
     ppGraph_(Post, G, B).

% Render lists
ppList([], []).
ppList([V], [B]) :-
  ppValue(empty, V, B).
ppList([V|Vs], [B|Bs]) :-
  Vs \= [],
  ppValue(text(','), V, B),
  ppList(Vs, Bs).
