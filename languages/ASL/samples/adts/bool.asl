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
  and(false, false) = false
  and(false, true) = false
  and(true, false) = false
  and(true, true) = true
  or(false, false) = false
  or(false, true) = true
  or(true, false) = true
  or(true, true) = true
