% Create a graph with
% languages as nodes and
% subset relationships as edges

:- module(ueberGraphLanguages, []).

graph(Ds, (Ns, Es)) :-
  findall(L, member(language(L), Ds), Ls),
  addId(1, Ls, IdLs),
  map(ueberGraphLanguages:node(Ds), IdLs, Ns),
  map(ueberGraphLanguages:edge(IdLs), IdLs, Ess),
  concat(Ess, Es).

% Node for a language
node(Ds, (Id, L), (IdAtom, Label, ellipse, Style)) :-
  format(atom(IdAtom), '~w', [Id]),
  format(atom(Label), '~w', [L]),
  ( member(membership(L, _, _), Ds) ->
        Style = [filled]
      ; Style = [] ).

% Edge for direct subset relationship
edge(IdLs, (Id1, L1), Es) :-
  ( (
      L1 =.. [_,L2],
      member((Id2, L2), IdLs)
    ) ->
        format(atom(IdAtom1), '~w', [Id1]),
        format(atom(IdAtom2), '~w', [Id2]),
        Es = [(IdAtom1, IdAtom2, [])]
      ; Es = [] ).
      
% Add an id to each language
addId(_, [], []).
addId(X, [L|Ls], [(X,L)|IdLs]) :-
  Y is X + 1, addId(Y, Ls, IdLs).
