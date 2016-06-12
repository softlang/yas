specification int
import nat1
sort Int
constructors
  zero : -> Int
  pos : Nat1 -> Int
  neg : Nat1 -> Int  
functions
  negate : Int -> Int
  add : Int x Int -> Int
  sub : Int x Int -> Int
variables
  i : Int
  i1 : Int
  i2 : Int
equations
  negate(zero) = zero
  negate(pos(n)) = neg(n)
  negate(neg(n)) = pos(n)
  add(zero, i) = i
  add(i, zero) = i
  add(pos(n1), pos(n2)) = pos(nat1:add(n1, n2))
  add(neg(n1), neg(n2)) = neg(nat1:add(n1, n2))
  add(pos(one), neg(one)) = zero
  add(pos(one), neg(succ(n))) = neg(n)
  add(pos(succ(n)), neg(one)) = pos(n)
  add(pos(succ(n1)), neg(succ(n2))) = add(pos(n1), neg(n2))
  sub(i1, i2) = add(i1, negate(i2))
