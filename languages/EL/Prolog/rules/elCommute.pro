% BEGIN ...
:- module(elCommute, []).
% END ...
binary(add, X, Y) ~> binary(add, Y, X).
binary(mul, X, Y) ~> binary(mul, Y, X).