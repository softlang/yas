% Render DGL-like graphs
dglPp(
  (Ns, Es), 
  vlist( [
    hlist([text(digraph), indent(text('G')), indent(text('{'))]),
    indent(indent(vbox(vlist(Bs1), vlist(Bs2)))),
    text('}')
  ] )
) :-
     map(ppDglNode, Ns, Bs1),
     map(ppDglEdge, Es, Bs2).

ppDglNode(
  (Id, Label, Shape, Style),
  hlist( [
    text(Id),
    text(' [label="'),
    text(Label),
    text('", shape='),
    text(Shape),
    hlist(Bs),
    text(']')
  ] )
) :-
     Style = [S] ->
         Bs = [
           text(', style='),
           text(S)
         ]
       ; Bs = [].

ppDglEdge(
  (From, To, Label),
  hlist( [
    text(From),
    text(' -> '),
    text(To),
    hlist(Bs)    
  ] ) 
) :-
     Label = [L] ->
         Bs = [
           text(' [label=" '),
           text(L),
           text(' "]')
         ]
       ; Bs = [].
