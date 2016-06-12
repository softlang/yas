% The sort of elements the sequences of which are to be sorted
sort Elem

% An ordering relation on the element sort
predicate leq : Elem x Elem

% The actual sorting function
function sort : Elem* -> Elem*

% Property of sort
property sortSorts(l1) : Elem* .
  let l2 : Elem* = sort(l1) in
     permutation(l1, l2) /\ sorted(l2)

% Count the number of occurrences of an element in a sequence
function count: Elem x Elem* -> Nat

% Property of count
property countCounts(e, l) : Elem x Elem* .
  count(e, l) = | [ x : Elem <- l | x = e ] |

/*

We assume a simple form of list comprehension here:

[ x : s <- l | p(x) ]

x: a free variable
s: sort of x
l: sequence from which to draw elements
p: a predicate (a formula) over x

The form is meant to enable filtering of lists.

So we range over all elements x of l and we select only those that meet predicate p.

In the example, we select all the "copies" of a given element e.

We use the | ... | notation to determine the length of a sequence.

*/

% One sequence being permutation of another
predicate permutation : Elem* x Elem*

% Key property of permutation
property permutationCount(l1, l2) : Elem* x Elem* .
      permutation(l1, l2)
  <=> forall e : Elem . count(e, l1) = count(e, l2)

/*

We use an inner form of universal quantification here.
Otherwise, the propery would need to parametrize over elements of the sequence.

The permutationCount property in words:
l1 is a permutation of l2 if and only if
- the sequences l1 and l2 are of the same length, and
- for all elements e of sort Elem, the count of e in l1 equals the one in l2.

*/

% Implied property of permutation
property permutationLength(l1, l2) : Elem* x Elem* .
  permutation(l1, l2) => |l1| = |l2|

% Implied property of permutation
property permutationElements(l1, l2) : Elem* x Elem* .
  permutation(l1, l2) => forall e : Elem . e <- l1 <=> e <- l2

% A sequence being sorted
predicate sorted : Elem*

% Key property of being sorted
property sortedProperty(l) : Elem .
      sorted(l)
  <=> ( forall n1 : Nat . forall n2 : Nat .
            n1 < |l|
	 /\ n2 < |l|
	 /\ n1 < n2 => leq l[n1] l[n2] )

/*

We assume a sort Nat for natural numbers.
We use Nat for length of sequences and indexes in sequences.
We use the form l[i] to retrieve the element at index of x in l.

The sortedProperty in words:
A sequence is sorted if and only if
for all natural numbers n1 and n2
such that n1 and n2 are smaller than the length of l (i.e., valid indexes)
and n1 < n2
it holds than the element at index n1 is less or equal than the one at n2.

*/

% Special case of sorting empty list
property sortEmptyList(l) : Elem* .
  |l| = 0 => sort(l) = l

% Special case of sorting non-empty list
property sortSingletonList(l) : Elem* x Elem .
  |l| = 1 => sort(l) = l
