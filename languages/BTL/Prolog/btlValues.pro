% Boolean values
isBool(true).
isBool(false).

% Natural numbers
isNat(zero).
isNat(succ(T)) :- isNat(T).

% Values
isValue(T) :- isBool(T).
isValue(T) :- isNat(T).
