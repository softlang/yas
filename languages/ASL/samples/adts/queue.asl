// Queues -- a FIFO containter
imports
  bool
  nat
sorts
  Elem
  Queue
constructors 
  empty : -> Queue
  enqueue : Elem x Queue -> Queue
functions
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
  front(enqueue(e, empty)) = e
  front(enqueue(e1, enqueue(e2, q))) = front(enqueue(e2, q))
  dequeue(enqueue(e, empty)) = empty
  dequeue(enqueue(e1, enqueue(e2, q))) = enqueue(e1, dequeue(enqueue(e2, q)))
  isEmpty(empty) = true
  isEmpty(enqueue(e, q)) = false
  length(empty) = zero
  length(enqueue(e, q)) = succ(length(q))
