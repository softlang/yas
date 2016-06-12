sort expr
sort stm
sort id
sort val
sort state

function eval : expr x state -> val
function run : stm x state -> state

function lookup : state x id -> val
function update : state x id x val -> state

function skip : stm
function assign : id x expr -> stm

property runSkip(s) : State .
  run(skip, s) = s

property runAssign(i, i', e, s) : id x id x expr x state .
  let v = eval(e, s) in
    let s' = run(assign(i, e), s) in
       lookup(s', i) = v /\ (not i = i' =>lookup(s',i') = lookup(s,i)

