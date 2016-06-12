// Natural numbers starting at "1"
specification nat1
import bool
sort Nat1
constructors
  one : -> Nat1
  succ : Nat1 -> Nat1
functions
  add : Nat1 x Nat1 -> Nat1
  isOne : Nat1 -> Bool
  pred : Nat1 -> Nat1? 
  sub : Nat1 x Nat1 -> Nat1?
variables
  n : Nat1
  n1 : Nat1
  n2 : Nat1
equations
  add(one, n) = succ(n)
  add(succ(n1), n2) = succ(add(n1, n2))
  isOne(one) = true
  isOne(succ(n)) = false
  pred(succ(n)) = n
  sub(succ(n), zero) = n
  sub(succ(n1), succ(n2)) = sub(n1, n2)
