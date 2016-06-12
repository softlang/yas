% Create a graph with
% functions and languages as nodes and
% domain and range relationships as edges
%
% Parsers are not shown.
%

:- module(ueberGraphFunctions, []).

graph(Ds, (Ns, Es)) :-
  % Select relevant entities
  functions(Ds, Fs),
  languages(Ds, Fs, Ls),

  % Compute nodes
  addId(1, Fs, I, IdFs),
  addId(I, Ls, _, IdLs),
  map(ueberGraphFunctions:fnode, IdFs, Ns1),
  map(ueberGraphFunctions:lnode, IdLs, Ns2),
  append(Ns1, Ns2, Ns),

  % Compute edges
  domains(IdFs, IdLs, Es1),
  ranges(IdFs, IdLs, Es2),
  append(Es1, Es2, Es).
  
% Blacklisted functions
%blacklisted(parser).
blacklisted(acceptBottomUp).
blacklisted(acceptTopDown).
blacklisted(parseTopDown).
%blacklisted(unparser).
%blacklisted(imploder).
%blacklisted(exploder).
%blacklisted(scanner).
blacklisted(scannerless).
blacklisted(scannerfull).
blacklisted(applyIO).
blacklisted(normalize1).
blacklisted(normalize2).
blacklisted(normalize3).
blacklisted(normalize4).
blacklisted(normalize5).

% Find all "wanted" functions
functions(Ds, Fs) :-
  findall(
	  (F,D,R,P),
	  ( member(function(F,D,R,P,_), Ds),
	    \+ blacklisted(F) ),
	  Fs).

% Find all relevant languages
languages(Ds, Fs, Ls) :-
  findall(
	  L,
	  ( member(language(L), Ds),
	    once( (
              member((_, Dl, Rl, _), Fs),
	      ( member(L, Dl); member(L, Rl) ) ) ) ),
          Ls).

% Node for a function
fnode((Id, (F,_,_,P)), (IdAtom, Label, box, [])) :-
  ( P = X:_ -> true; X = P ),
  format(atom(IdAtom), '~w', [Id]),
  format(atom(Label), '~w # ~w', [F,X]).

% Node for a language
lnode((Id, L), (IdAtom, Label, ellipse, [filled])) :-
  format(atom(IdAtom), '~w', [Id]),
  format(atom(Label), '~w', [L]).

% Compute domain edges
domains(IdFs, IdLs, Es) :-
  findall(
	  (IdAtom1, IdAtom2, []),
	  ( member((Id2, (_, D, _, _)), IdFs),
	    member((Id1, L), IdLs),
  	    once( (
	      member(L, D),
              format(atom(IdAtom1), '~w', [Id1]),
              format(atom(IdAtom2), '~w', [Id2]) ) ) ),
	  Es).

% Compute range edges
ranges(IdFs, IdLs, Es) :-
  findall(
	  (IdAtom1, IdAtom2, []),
	  ( member((Id1, (_, _, R, _)), IdFs),
	    member((Id2, L), IdLs),
            once( (
              member(L, R),
              format(atom(IdAtom1), '~w', [Id1]),
              format(atom(IdAtom2), '~w', [Id2]) ) ) ),
	  Es).

% Add an id to each entity
addId(I, [], I, []).
addId(I1, [X|Xs], I3, [(I1,X)|IdXs]) :-
  I2 is I1 + 1, addId(I2, Xs, I3, IdXs).
