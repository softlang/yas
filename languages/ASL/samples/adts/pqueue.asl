//
// Priority queues
// Front element is the one with the "greatest" priority.
// Elements with same priority are returned in FIFO order.
//
specification pqueue
imports
  bool
  nat
sorts
  Elem
  PQueue
hidden constructors
  empty' : -> PQueue
  enqueue' : Elem x Nat x PQueue -> PQueue
functions
  empty : -> PQueue
  // Use natural numbers for priorities
  enqueue : Elem x Nat x PQueue -> PQueue
  front : PQueue -> Elem? // Front element
  dequeue : PQueue -> PQueue? // Queue without front element
  isEmpty : PQueue -> Bool // Test for empty queue
  length : PQueue -> Nat // Number of elements in the queue
variables
  e : Elem
  e1 : Elem
  e2 : Elem
  q : PQueue
  p : Nat
  p1 : Nat
  p2 : Nat
equations
  empty = empty'
  // Enqueue by "insertion sort"
  enqueue(e, p, empty') = enqueue'(e, p, empty')
  enqueue(e1, p1, enqueue'(e2, p2, q)) =
    if greater(p1, p2)
      then enqueue'(e1, p1, enqueue'(e2, p2, q))
      else enqueue'(e2, p2, enqueue(e1, p1, q))
  front(enqueue'(e, p, q)) = e
  dequeue(enqueue'(e, p, q)) = q
  isEmpty(empty) = true
  isEmpty(enqueue(e, p, q)) = false
  length(empty) = zero
  length(enqueue(e, p, q)) = succ(length(q))
