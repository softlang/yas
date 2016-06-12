// Stacks -- a LIFO containter
specification stack
imports
  bool
  nat
sorts
  Elem
  Stack
constructors 
  empty : -> Stack
  push : Elem x Stack -> Stack
functions
  top : Stack -> Elem? // Top-most element
  pop : Stack -> Stack? // Stack without top-most element
  isEmpty : Stack -> Bool // Test for empty stack
  length : Stack -> Nat // Number of elements on the stack
variables
  e : Elem
  s : Stack
equations
  top(push(e, s)) = e
  pop(push(e, s)) = s
  isEmpty(empty) = true
  isEmpty(push(e, s)) = false
  length(empty) = zero
  length(push(e, s)) = succ(length(s))
