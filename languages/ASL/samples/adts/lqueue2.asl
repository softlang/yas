// Queues defined in terms of lists; variant 2
specification lqueue2
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
  enqueue(e, q) = snoc(e, q) // enqueue appends
  front(q) = head(q) // front returns head
  dequeue(q) = tail(q) // dequeue returns tail
  isEmpty(q) = isNil(q)
  length(q) = list:length(q)
