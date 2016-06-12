% BEGIN ...
:- module(pplRender, []).
% END ...
% Top-level predicate
render(Box, S) :-
  box(Box, L),
  with_output_to(codes(S), map(pplRender:line, L)).

% Evaluate an empty box
box(empty, []).

% Evaluate a text box
box(text(A), [S]) :-
  atom_codes(A, S).

% Evaluate an integer
box(integer(I), [S]) :-
  atom_codes(I, S).

% Evaluate a horizontal composition
box(hbox(B1, B2), L3) :-
  box(B1, L1),
  box(B2, L2),
  happendb(L1, L2, L3).

% Vector form of horizontal composition
box(hlist(Bs), L) :-
  map(pplRender:box, Bs, Ls),
  foldr(pplRender:happendb, [], Ls, L).

% hlist with separator
box(hseplist(B, Bs1), L) :-
  intersperse(B, Bs1, Bs2),
  map(pplRender:box, Bs2, Ls),
  foldr(pplRender:happendb, [], Ls, L).

% Apply indentation
box(indent(B), L) :-
  box(hbox(text(' '), B), L).

% Evaluate a vertical composition
box(vbox(B1, B2), L3) :-
  box(B1, L1),
  box(B2, L2),
  append(L1, L2, L3).

% Vector form of vertical composition
box(vlist(Bs), L) :-
  map(pplRender:box, Bs, Ls),
  foldr(append, [], Ls, L).

% Bottom alignment; horizontal composition of boxes
happendb([], L, L).
happendb(L, [], L).
happendb(L1, [L2a|L2b], L3c) :-
    append(L1a, [L1b], L1),
    length(L1b, Len),
    copy(0' , Len, Spaces),
    append(L1b, L2a, L3a),
    happendFillLeft(Spaces, L2b, L3b),
    append(L1a, [L3a|L3b], L3c).

happendFillLeft(_, [], []).
happendFillLeft(Spaces, [L1|L2], [L3|L4]) :-
    append(Spaces, L1, L3),
    happendFillLeft(Spaces, L2, L4).
    
% Top alignment; horizontal composition of boxes
happendt(L1, L2, L3) :-
    map(length, L1, Lens),
    foldr(max, 0, Lens, Len),
    happendt(Len, L1, L2, L3).

% Helper for happendt/3
happendt(_, [], [], []).
happendt(Len1, [H1|T1], [H2|T2], [H3|T3]) :-
    length(H1, Len2),
    Len3 = Len1 - Len2,
    copy(0' , Len3, Spaces),
    concat([Spaces, H1, H2], H3),
    happendt(Len1, T1, T2, T3).
happendt(_, [H1|T1], [], [H1|T1]).
happendt(Len, [], [H2|T2], [H3|T3]) :-
    copy(0' , Len, Spaces),
    append(Spaces, H2, H3),
    happendt(Len, [], T2, T3).
  
% Helper for "printing" lines (strings)
line(S) :-
  format('~s~n', [S]).
