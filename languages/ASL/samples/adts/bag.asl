// Multisets
specification bag
imports
  bool
  nat
sorts
  Elem
  Bag
constructors
  empty : -> Bag
  add : Elem x Bag -> Set
functions
  member : Elem x Bag -> Bool
  count : Elem x Bag -> Nat
  eq : Elem x Elem -> Bool
variables
  e : Elem
  e1 : Elem
  e2 : Elem
  b : Bag
equations
  member(e, empty) = false
  member(e1, add(e2, b)) = or(eq(e1, e2), member(e1, b)
  count(e, empty) = zero
  count(e1, add(e2, b)) = add(count(e1, b), if e1=e2 then succ(zero) else zero
