// Stacks defined in terms of lists
specification lstack
imports
  bool
  nat
  list [ List as Stack ]
functions
  empty : -> Stack // Empty stack
  push : Elem x Stack -> Stack // Push element onto stack
  top : Stack -> Elem? // Top-most element
  pop : Stack -> Stack? // Stack without top-most element
  isEmpty : Stack -> Bool // Test for empty stack
  length : Stack -> Nat // Number of elements on the stack
variables
  e : Elem
  s : Stack
equations
  empty = nil
  push(e, s) = cons(e, l)
  top(s) = head(s)
  pop(s) = tail(s)
  isEmpty(s) = isNil(s)
  length(s) = list:length(s)
