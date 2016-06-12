import salaries

sort Employee
sort Name
sort Address

-- Constructor
function mkEmployee : Name x Address x Salary -> Employee?

-- Getters
function getEmployeeName : Employee -> Name
function getAddress : Employee -> Address
function getSalary : Employee -> Salary

-- Setters
function setEmployeeName : Employee x Name -> Employee
function setAddress : Employee x Address -> Employee
function setSalary : Employee x Salary -> Employee?

-- Invariant for employees
property employeeInvariant(e) : Employee .
  nonnegativeSalary(getSalary(e))

-- Property of constructor in terms of getters
property employeeConstruction(n, a, s) : Name x Address x Salary .
  let e = mkEmployee(n, a, s) in
       getEmployeeName(e) = n
    /\ getAddress(e) = a
    /\ getSalary(e) = s

-- Property of the salary setter
property modifySalaryOnly(e0, s1) : Employee x Salary .
  nonnegativeSalary(s1) =>
    let e1 = setSalary e0 s1 in
         getEmployeeName(e0) = getEmployeeName(e1)
      /\ getAddress(e0) = getAddress(e1)
      /\ s1 = getSalary(e1)
