% Render Java declaration
ppJavaDecl(J, S) :-
  once(ppJavaDecl_(J, B)),
  pplRender:render(vbox(text('// Generated code'), B), S).

% Render class declaration
ppJavaDecl_(
  class(V, A, N, Ns, X, Ms),
  vlist( [
    hlist( [
      text(V),
      AB,
      indent(text('class')),
      indent(text(N)),
      NsB,
      XB,
      indent(text('{'))
    ] ),
    indent(indent(vlist(MBs))),
    text('}')
  ] )
) :-
     ( A -> 
           AB = indent(text('abstract'))
         ; AB = empty),
     map(ppJavaName, Ns, NBs),
     ( Ns == [] ->
           NsB = empty
         ; NsB = hlist([text('<'), hseplist(text(', '), NBs), text('>')])),
     ( X = [T] ->
           ppJavaType(T, TB),
           XB = hbox(indent(text(extends)), indent(TB))
         ; XB = empty),
     map(ppJavaMember(N), Ms, MBs).
     
% Render enum declaration
ppJavaDecl_(
  enum(V, N, Ns),
  hlist( [
    text(V),
    indent(text('enum')),
    indent(text(N)),
    indent(text('{')),
    hseplist(text(', '), Bs),
    text('}')
  ] )  
) :-
     map(ppJavaName, Ns, Bs).

% Render unqualified name
ppJavaName(N, text(N)).

% Render constructor member
ppJavaMember(
  N,
  constr(V, Ps, Ss),
  vlist( [
    hlist( [
      text(V),
      indent(text(N)),
      text('('),
      hseplist(text(', '), PBs),
      text(')'),
      indent(text('{'))
    ] ),
    indent(indent(vlist(SBs))),
    text('}')
  ] )
) :-
     map(ppJavaMpara, Ps, PBs),
     map(ppJavaStm, Ss, SBs).

% Render method parameter
ppJavaMpara(
  (T, N),
  hbox(B, indent(text(N)))
) :-
     ppJavaType(T, B).

% Render typename
ppJavaType(
  typename(N),
  text(N)
).

% Render (generic) type application
ppJavaType(
  typeapp(N, Ts),
  hlist( [
    text(N),
    text('<'),
    hseplist(text(', '), Bs),
    text('>')
  ] )
) :-     
     map(ppJavaType, Ts, Bs).

% Render statement expression
ppJavaStm(
  expression(E),
  hbox(B, text(';'))
) :-
     ppJavaExpr(E, B).

% Render assignment
ppJavaStm(
  assign(E1, E2),
  hlist([B1, indent(text('=')), indent(B2), text(';')])
) :-
     ppJavaExpr(E1, B1),
     ppJavaExpr(E2, B2).

% Render method call
ppJavaExpr(
  call(N, Es),
  hlist( [
    text(N),
    text('('),
    hseplist(text(', '), Bs),
    text(')')
  ] )
) :-
     map(ppJavaExpr, Es, Bs).

% Render null
ppJavaExpr(null, text(null)).

% Render this
ppJavaExpr(this, text(this)).

% Render name expressions
ppJavaExpr(name(N), text(N)).

% Render selection (".")
ppJavaExpr(
  select(E, N),
  hlist([B, text('.'), text(N)])
) :-
     ppJavaExpr(E, B).
