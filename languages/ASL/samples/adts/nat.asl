// Natural numbers starting at "0"
specification nat
import bool
sort Nat
constructors
  zero : -> Nat
  succ : Nat -> Nat
functions
  add : Nat x Nat -> Nat
  isZero : Nat -> Bool
  pred : Nat -> Nat? 
  sub : Nat x Nat -> Nat?
  eq : Nat x Nat -> Bool
  greater : Nat x Nat -> Bool
variables
  n : Nat
  n1 : Nat
  n2 : Nat
equations
  add(zero, n) = n
  add(succ(n1), n2) = succ(add(n1, n2))
  isZero(zero) = true
  isZero(succ(n)) = false
  pred(succ(n)) = n
  sub(n, zero) = n
  sub(succ(n1), succ(n2)) = sub(n1, n2)
  eq(zero, zero) = true
  eq(zero, succ(n)) = false
  eq(succ(n), zero) = false
  eq(succ(n1), succ(n2)) = eq(n1, n2)
  greater(zero, zero) = true
  greater(zero, succ(n)) = false
  greater(succ(n), zero) = true
  greater(succ(n1), succ(n2)) = greater(n1, n2)
