specification bool
sort Bool
constructors
  true : -> Bool
  false : -> Bool
functions
  not : Bool -> Bool
  and : Bool x Bool -> Bool
  or : Bool x Bool -> Bool
equations
  not(true) = false
  not(false) = true
  add(false, false) = false
  add(false, true) = false
  add(true, false) = false
  add(true, true) = true
  or(false, false) = false
  or(false, true) = true
  or(true, false) = true
  or(true, true) = true
