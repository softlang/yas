-- Salaries as signed numbers

sort Salary

-- Addition for salaries
function addSalary : Salary x Salary -> Salary

-- Unit for addition
function zeroSalary : Salary

-- Limited division
function halveSalary : Salary -> Salary

-- Sign inspection
predicate isPositiveSalary : Salary 
predicate isNegativeSalary : Salary 
predicate isZeroSalary : Salary
predicate isNonNegativeSalary : Salary 
predicate isNonPositiveSalary : Salary 

-- Comparison
predicate isGreaterSalary : Salary x Salary

-- zeroSalary is left and right unit of addSalary
property zeroUnit(s) : Salary .
     addSalary(s, zeroSalary) = s
  /\ addSalary(zeroSalary, s) = s

-- addSalary is commutative
property addCommutative(s1, s2) : Salary x Salary .
  addSalary(s1, s2) = addSalary(s2, s1)

-- addSalary is associative
property addAssociative(s1, s2, s3) : Salary x Salary x Salary .
  addSalary(s1, addSalary(s2, s3)) = addSalary(addSalary(s1, s2), s3)
  
-- Property of halving
property halving(s0) : Salary .
  let s1 = halveSalary(s0) in
       isNonNegativeSalary(s0) => isNonNegativeSalary(s1)
    /\ isPositiveSalary(s0) => isNonNegativeSalary(s1)
    /\ isPositiveSalary(s0) => isGreaterSalary(s0, s1)
    /\ addSalary(s1, s1) = s0
