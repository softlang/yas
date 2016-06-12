:- module(biplStore, []).

store([]).
store([(N, V)|Sto]) :- atom(N), intOrBool:value(V), store(Sto).

