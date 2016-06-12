specification set
imports
  bool
  nat
sorts
  Elem
  Set
hidden constructors
  empty' : -> Set
  add' : Elem x Set -> Set
functions
  empty : -> Set
  add : Elem x Set -> Set
  member : Elem x Set -> Bool
  eq : Elem x Elem -> Bool
  count : Set -> Nat
variables
  e : Elem
  e1 : Elem
  e2 : Elem
  s : Set
equations
  empty = empty'
  add(e, s) = if member(e, s) then s else add'(e, s)
  member(e, empty') = false
  member(e1, add'(e2, s)) = or(eq(e1, e2), member(e1, s))
  count(empty') = zero
  count(add'(e, s)) = succ(count(s))
