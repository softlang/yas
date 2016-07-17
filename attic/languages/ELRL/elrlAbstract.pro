% BEGIN ...
:- module(elrlAbstract, []).

% END ...
term:'_term'(X) => '_expr'(X).
X:Y => Z :- elAbstract:'=>'(X:Y, Z).
X:Y => Z :- rlAbstract:'=>'(X:Y, Z).
