:- module(egtlExtension, []).

ok(sequ(Ts)) :- map(egtlExtension:ok, Ts).
ok(generalize(_, _)).
ok(add(_)).
