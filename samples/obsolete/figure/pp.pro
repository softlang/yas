% Pretty print figures with one line per element
figurePp(F, vlist(Bs)) :-
  map(ppElement, F, Bs).

% End each element by a semicolon
ppElement(E, hbox(B, text(';'))) :-
  ppElement_(E, B).

% Pretty print a line
ppElement_(
  line(P1, P2),
  hlist([
    text('line'),
    text(' from: '),
    B1, 
    text(', to: '),
    B2 
  ])
) :-
     ppPoint(P1, B1),
     ppPoint(P2, B2).

% Pretty print a circle 
ppElement_(
  circle(P, I),
  hlist([
    text('circle'),
    text(' origin: '),
    B1, 
    text(', radius: '),
    B2 
  ])
) :-
     ppPoint(P, B1),
     ppInteger(I, B2).

% Pretty print a point
ppPoint(
  (X, Y),
  hlist([text('('), B1, text(', '), B2, text(')')])  
) :-
     ppInteger(X, B1),
     ppInteger(Y, B2).

% Pretty print an integer
ppInteger(I, integer(I)).

