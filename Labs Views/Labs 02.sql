/* poner en uso la base de datos*/

use AdventureWorks2016;

--muestrame el nombre, apellido, departamento, estado civil del empleado ---
select Person.FirstName as nombres ,Person.LastName as apellido ,Employee.MaritalStatus as 'estado civil'
,HumanResources.Department.Name as'departamento'
 from HumanResources.EmployeeDepartmentHistory
INNER JOIN Person.Person on 
EmployeeDepartmentHistory.BusinessEntityID = Person.BusinessEntityID
INNER JOIN HumanResources.Department
on HumanResources.EmployeeDepartmentHistory.BusinessEntityID =
inner JOIN HumanResources.Department
on EmployeeDepartmentHistory.DepartmentID=Department.DepartmentID


select * from HumanResources.Department
---muestrame el listado de clientes que hicieron su pedido de compra en los meses de noviembre y diciembre del año 2012 ---
select * from Sales.Customer
select datename(MONTH,Sales.SalesOrderHeader.OrderDate) as 'Mes' from Sales.SalesOrderHeader where Sales.SalesOrderHeader.OrderDate = 'November'


select concat(person.FirstName,',',Person.LastName) as 'cliente',Concat(MONTH(OrderDate),'/',year(OrderDate)) as 'Mes Y año'
from Sales.SalesOrderHeader
INNER JOIN Sales.Customer
on SalesOrderHeader.CustomerID=Sales.Customer.CustomerID
INNER JOIN Person.Person
on Customer.PersonID =Person.BusinessEntityID
where year (OrderDate)=2012 and (MONTH(OrderDate) Between 11 and 12)
---Muestrame la cantidad de ordenes de pedido atendidos por cada medio de envio ---
select Purchasing.ShipMethod.Name as 'medio de envío',
count (Purchasing.ShipMethod.Name) as 'cantidad'
from Sales.SalesOrderHeader 
inner JOIN Purchasing.ShipMethod
on Sales.SalesOrderHeader.ShipMethodID  =Purchasing.ShipMethod.ShipMethodID
GROUP by Purchasing.ShipMethod.Name


---Mostrar la cantidad de ventas realizadas de acuerdo al país---

select País =
 case 
 when Sales.SalesTerritory.CountryRegionCode = 'AU' then 'Australia'
 when Sales.SalesTerritory.CountryRegionCode = 'US' then 'Estados Unidos'
 when Sales.SalesTerritory.CountryRegionCode = 'DE' then 'Alemania'
 when Sales.SalesTerritory.CountryRegionCode = 'FR' then 'Francia'
 when Sales.SalesTerritory.CountryRegionCode = 'GB' then 'Inglaterra'
 when Sales.SalesTerritory.CountryRegionCode = 'CA' then 'Canadá'
end,

sales.SalesTerritory.Name as 'Estado',
count (Sales.SalesOrderHeader.TerritoryID) as 'total'
 from sales.SalesOrderHeader 
 inner JOIN Sales.SalesTerritory
 on Sales.SalesOrderHeader.TerritoryID = Sales.SalesTerritory.TerritoryID
 GROUP BY Sales.SalesTerritory.CountryRegionCode,Sales.SalesTerritory.Name
order by Sales.SalesTerritory.CountryRegionCode

