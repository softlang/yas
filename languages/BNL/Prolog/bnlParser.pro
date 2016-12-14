% BEGIN ...
:- module(bnlParser, []).
% END ...
number(number(Bs, R)) --> bits(Bs), rest(R).
bits(single(B)) --> bit(B).  
bits(many(B, Bs)) --> bit(B), bits(Bs).
bit(zero) --> ['0'].
bit(one) --> ['1'].
rest(integer) --> [].
rest(rational(Bs)) --> ['.'], bits(Bs).
