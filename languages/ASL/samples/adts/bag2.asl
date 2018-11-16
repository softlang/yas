// Multisets
specification bag
imports
  bool
  nat
sorts
  Bag
constructors
  empty : -> Bag
  add : Nat x Bag -> Bag
functions
  member : Nat x Bag -> Bool
  count : Nat x Bag -> Nat
variables
  n : Nat
  n1 : Nat
  n2 : Nat
  b : Bag
equations
  member(n, empty) = false
  member(n1, add(n2, b)) = or(eq(n1, n2), member(n1, b))
  count(n, empty) = zero
  count(n1, add(n2, b)) = if eq(n1, n2) then succ(count(n1, b)) else count(n1, b)
