import salaries
import emplyoees
import companies

function totalSalaries : Company -> Salary
function cutSalaries : Company -> Company

-- Property of total to be zero for a company without employees
property totalNoEmployees(c) : Company .
  getEmployees(c) = [] =>
    totalSalaries(c) = zeroSalary

-- Property of every employee to count for total
property totalEmployeeCounts(c, e) : Company x Employee .
  let n = getEmployeeName(e) in
    isEmployed(c, n) =>
      totalSalaries(c) = addSalary(getSalary(e), totalSalaries(removeEmployee(c, e))) 

-- Property of cut relative to total
property cutTotal(c) : Company .
  halveSalary(totalSalaries(c)) = totalSalaries(cutSalaries(c))
