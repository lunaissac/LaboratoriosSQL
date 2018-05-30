

/*Para esta práctica vamos a utilizar la base de datos Adventure works 2016 */


---elabore el código transact SQL para resolver los siguientes enunciados ---

---Se necesita listar los empleados y sus respectivos departamentos en el que laboram ---

use AdventureWorks2016
create VIEW empleado
as select BusinessEntityID,DepartmentID
from HumanResources.EmployeeDepartmentHistory

select*from empleado

create VIEW empleados
as select HumanResources.Employee.LoginID,HumanResources.Department.Name
from HumanResources.Employee,HumanResources.Department

select*from empleados



---Se necesita saber la cantidad de empleados por departamento---

SELECT	COUNT(*)
FROM	HumanResources.Employee, HumanResources.Department



---Se necesita listar lascantidades de ventas realizadas por año ---
---Se necesita listar los empleados con su respectivo correo y numero de teléfono---
---Se necesita saber la cantidad de ventas atendidas por cada vendedor---
---Cada uno de los enunciados deben ser considerados vistas ---

/*Se calificará desde su repositorio de guithub en la que */