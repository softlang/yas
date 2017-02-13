% BEGIN ...
:- module(bfplOp, []).
% END ...
% Operand types of operators
ok(add, inttype, inttype, inttype).
ok(sub, inttype, inttype, inttype).
ok(mul, inttype, inttype, inttype).
ok(eq, inttype, inttype, booltype).
