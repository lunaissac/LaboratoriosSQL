

use AdventureWorks2016
GO
select name from sys.schemas;

---ver tablas de base de datos en uso---
select name from sys.tables;
GO

---Ver estructura de una tabla  especifica---
ExEC sp_help 'HumanResources.Employee'

/* Ver listado de departamentos de la empresa*/
select * from HumanResources.Department
---Visualizar solo los departamentos  que pertenesen al grupo Marketing y ventas ---
select * from HumanResources.Department where HumanResources.Department.GroupName = 'Sales and Marketing'

--- o de otra forma---
select * from HumanResources.Employee

---Ver listado de los empleados CULLO ESTADOS CIVIL ES CASADO---
select * from HumanResources.Employee WHERE HumanResources.Employee.MaritalStatus like 'M'

select HumanResources.Employee.BusinessEdEntityID as 'Codigo de empleado',
HumanResources.E
 WHERE HumanResources.Employee like 'M'

---ver listad de las ordenes de las ventas ---

select * from sales.SalesOrderHeader
---ver listado el codigo de las ordenes de las ventas y su respectivo mes y año---
select Sales.SalesOrderHeader.SalesOrderID as 'Codig ode orden  ', 
datename(MONTH,Sales.SalesOrderHeader.OrderDate) as 'Mes',
year(sales.SalesOrderHeader.OrderDate) as 'año'

from sales.SalesOrderHeader
---ver listado el codigo de las ordenes de las ventas y su respectivo mes del  año 2013---

select Sales.SalesOrderHeader.SalesOrderID as 'Codig ode orden  ', 
datename(MONTH,Sales.SalesOrderHeader.OrderDate) as 'Mes',
year(sales.SalesOrderHeader.OrderDate) as 'año'
from sales.SalesOrderHeader
where Sales.SalesOrderHeader.OrderDate ='2013'

---otra forma---
---where year (Sales.SalesOrderHeader.OrderDate )=2013---

---visualizar la cantidad de ordenes de venta del año 2013 ---
select year( Sales.SalesOrderHeader.OrderDate) as 'Año',
count( Sales.SalesOrderHeader.SalesOrderID) as 'cantidad'
from Sales.SalesOrderHeader
where year(sales.SalesOrderHeader.OrderDate)=2013
GROUP by year(Sales.SalesOrderHeader.OrderDate)

---visualizar la cantidad de ventas por mes del año 2011---


select year( Sales.SalesOrderHeader.OrderDate) as 'Año',
datename(MONTH,Sales.SalesOrderHeader.OrderDate) as 'Mes',
count( Sales.SalesOrderHeader.SalesOrderID) as 'cantidad'
from Sales.SalesOrderHeader
where year(sales.SalesOrderHeader.OrderDate)=2011
GROUP by year(Sales.SalesOrderHeader.OrderDate),
DATENAME(MONTH,Sales.SalesOrderHeader.OrderDate)


---cantidad de empleados cargo---
---paso1---
select * from HumanResources.Employee
---paso2---
select HumanResources.Employee.BusinessEntityID, HumanResources.Employee.JobTitle
from HumanResources.Employee

---paso3---
select count ( HumanResources.Employee.BusinessEntityID)as 'total',
  HumanResources.Employee.JobTitle as 'cargo'
from HumanResources.Employee
GROUP by HumanResources.Employee.JobTitle
---paso4---
select count ( HumanResources.Employee.BusinessEntityID)as 'total',
  HumanResources.Employee.JobTitle as 'cargo'
from HumanResources.Employee
GROUP by HumanResources.Employee.JobTitle
order by count(HumanResources.Employee.BusinessEntityID) desc  

-- desc  es decendente-- 

---listado de empleados nombre apellidos y su cargo---


select Person.PersonType 

 from  Person.Person

 select  Person.PersonType
  from Person.Person where Person.PersonType like 'EM'


  ---profe----

  select HumanResources.EmployeeDepartmentHistory.BusinessEntityID
  from HumanResources.EmployeeDepartmentHistory
  inner join Person.Person
  on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
---  ---
select Person.FirstName as nombre ,Person.LastName as apellido,
   HumanResources.Department.name as departamento
  from HumanResources.EmployeeDepartmentHistory
  inner join Person.Person
  on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID

inner join HumanResources.Department
  on HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID


--- mostrar la cantidad de empleados por---

select count (HumanResources.EmployeeDepartmentHistory.BusinessEntityID) AS 'Total',
   HumanResources.Department.name as departamento
  from HumanResources.EmployeeDepartmentHistory
  inner join Person.Person
  on HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
inner join HumanResources.Department
  on HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID

  GROUP by HumanResources.Department.Name


--- Mostrar la cantidad de empleados por estado civil /en cada departamento---

select* from HumanResources.Employee

select HumanResources.Employee.MaritalStatus as 'Estado civil'
from HumanResources.Employee

select HumanResources.Employee.MaritalStatus as 'Estado civil',
count (HumanResources.Employee.BusinessEntityID) as 'cantidad'
from HumanResources.Employee

select HumanResources.Employee.MaritalStatus as 'Estado civil',
count (HumanResources.Employee.BusinessEntityID) as 'cantidad'
from HumanResources.Employee
group by HumanResources.Employee.MaritalStatus

select HumanResources.Department.Name as 'departament',
HumanResources.Employee.MaritalStatus as 'Estado civil',
count (HumanResources.Employee.BusinessEntityID) as 'cantidad'
from HumanResources.Employee
inner join HumanResources.EmployeeDepartmentHistory
on HumanResources.Employee.BusinessEntityID = HumanResources.EmployeeDepartmentHistory.BusinessEntityID
INNER join HumanResources.Department
on HumanResources.EmployeeDepartmentHistory.DepartmentID=HumanResources.Department.DepartmentID
group by HumanResources.Employee.MaritalStatus, HumanResources.EmployeeDepartmentHistory.DepartmentID,
HumanResources.Department.Name


---muestrame el nombre ,apellido,departamento,estado civil del empleado---




---muestrame el listado de clientes que hicieron su orden de compra en los meses de noviembre y diciembre del año 2012---



---Muestrame  la cantidad de ordenes de pedido atendidos por cada medio de envio---
select * from Purchasing.ShipMethod