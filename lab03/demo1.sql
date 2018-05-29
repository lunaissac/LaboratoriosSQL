use AdventureWorks2016

select *from Person.Person

create VIEW vw_Persona
as select firstName,LastName
from Person.Person

select*from vw_Persona


create VIEW vw_Persona2
as select firstName,LastName
from Person.Person
where LastName like 'Adams'

drop view vw_Persona2

select*from vw_Persona2

create VIEW vw_Persona3 
AS
select CONCAT(firstName,',',LastName) as datos
from Person.Person
Where LastName LIKE 'Adams'
select*from vw_Persona3

