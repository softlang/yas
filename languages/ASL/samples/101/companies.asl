-- Flat companies (as opposed to hierarchical companies)

import salaries
import employees

-- Sorts for companies
sort Company

-- Constructor
function mkCompany : Name x Employee* -> Company?

-- Getters
function getCompanyName : Company -> Name
function getEmployees : Company -> Employee*

-- Container operations (related to CRUD)
predicate isEmployed : Company x Name
function findEmployee : Company -> Name -> Employee?
function addEmployee : Company -> Employee -> Company?
function removeEmployee : Company -> Name -> Company?
function updateEmployee : Company -> Employee -> Company?

-- Invariant for companies
property companyInvariant(c, e1, e2) : Company x Employee x Employee .
  let es = getEmployees(c) in
    e1 <- es /\ e2 <- es /\ ~ e1 = e2
      => ~ (getEmployeeName(e1) = getEmployeeName(e2))

-- Property of constructor in terms of getters
property companyConstruction(n, es) : Name x Employee* .
  let c = mkCompany(n, es) in
       getCompanyName(c) = n
    /\ getEmployees(c) = es

-- Property of addEmployee
property addEmployeeIndeed(c, e) : Company x Employee .
  let n = getEmployeeName(e) in
    ~ isEmployed(c, n) =>
         isEmployed(addEmployee(c, e), n)
      /\ findEmployee(c, n) = e

-- Property of removeEmployee
property removeEmployeeIndeed(c, n) : Company x Name .
  isEmployed(c, n) => ~ isEmployed(removeEmployee(c, n), n)

-- Property of updateEmployee
property updateEmployeeIndeed(c0, e) : Company x Employee .
  let n = getEmployeeName(e) in
    isEmployed(c0, n) =>
      let c1 = removeEmployee(c0, n) in
        let c2 = addEmployee(c1, e) in
	  findEmployee(c2, n) = e
