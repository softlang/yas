:- module(bmplToProlog, []).

main(Rs, T) :-
    % Retrieve output file's basename for use as module's name
    nb_getval(current, mapsTo(_, _, [F])),
    file_base_name(F, BaseExt),
    file_name_extension(Base, Ext, BaseExt),
    B = hlist([text(':- module('), text(Base), text(', []).')]),

    % Map BRL rules to Prolog clauses
    map(bmplToProlog:rule, Rs, Bs),
    pplRender:render(vlist([text('% BEGIN ...'),B,text('% END ...')|Bs]), T).

rule((E1, E2), hlist([B1, text(' ~> '), B2, text('.')])) :-
    expr(E1, B1),
    expr(E2, B2).    

expr(var(X), text(X)).
expr(functor(F, []), text(F)).
expr(functor(F, Es), hlist([
				  text(F),
				  text('('),
				  hseplist(text(', '), Bs),
				  text(')')])) :-
    \+ Es == [],
    map(bmplToProlog:expr, Es, Bs).    
expr(integer(X), integer(X)).
