// Queues defined in terms of lists; variant 1
specification lqueue1
imports
  bool
  nat
  list [ List as Queue ]
functions
  empty : -> Queue
  enqueue : Elem x Queue -> Queue
  front : Queue -> Elem? // Front element
  dequeue : Queue -> Queue? // Queue without front element
  isEmpty : Queue -> Bool // Test for empty queue
  length : Queue -> Nat // Number of elements in the queue
variables
  e : Elem
  e1 : Elem
  e2 : Elem
  q : Queue
equations
  empty = nil
  enqueue(e, q) = cons(e, q) // enqueue conses
  front(q) = last(q) // front returns last
  dequeue(q) = init(q) // dequeue returns init
  isEmpty(q) = isNil(q)
  length(q) = list:length(q)
