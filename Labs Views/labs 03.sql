SELECT TOP (1000) [idLibro]
      ,[tituloLibro]
      ,[numpagLibro]
      ,[cantLibro]
      ,[Genero_idGenero]
      ,[Autor_idAutor]
      ,[Pais_idPais]
  FROM [dbLibrary].[dbo].[Libro]


create view detalle1

as
go
  select Autor.nomAutor,Libro.tituloLibro, Pais.nomPais,Genero.nomGenero from Autor
inner join Libro on Libro.Autor_idAutor=Autor.idAutor
inner join Genero on Genero.idGenero=Libro.Genero_idGenero
inner join Pais ON Pais.idPais=Libro.Pais_idPais

go
select Genero.nomGenero as genero ,COUNT(Libro.Genero_idGenero)as total
from Libro
inner join Genero on Libro.Genero_idGenero=Genero.idGenero
GROUP by genero.nomGenero



select * from Libro

create VIEW cantidadlibropais
AS
go
select Pais.nomPais as  pais ,COUNT(Pais.idPais)as total
from Libro
inner join Pais on Libro.Pais_idPais=Pais.idPais
GROUP by Pais.nomPais
select * from Detalle_Prestamo
select * from Prestamos


select Libro.tituloLibro,Prestamos.fecdevPrestamo FROM Detalle_Prestamo


inner join Libro on Libro.idLibro= Detalle_Prestamo.Libro_idLibro
inner join Prestamos on Prestamos.idPrestamo = Detalle_Prestamo.Prestamos_idPrestamo


select Cliente.nomCliente,Bibliotecario.nomBibliotecario from Detalle_Prestamo
inner join Prestamos on Cliente.idCliente=Prestamos.Cliente_idCliente
inner join Cliente on Cliente.nomCliente= Prestamos.Cliente_idCliente


select cliente.nomCliente,Bibliotecario.nomBibliotecario from prestamos

inner join Cliente on Cliente.idCliente=Prestamos.Cliente_idCliente
inner join Bibliotecario on Bibliotecario.idBibliotecario=Prestamos.Bibliotecario_idBibliotecario
inner join Detalle_Prestamo
on Detalle_Prestamo.idDetPrest=Prestamos.idPrestamo


select Prestamos.fecdevPrestamo,
CONCAT(Bibliotecario.apeBibliotecario,',',Bibliotecario.nomBibliotecario) as bibliotecario,Libro.tituloLibro
from Prestamos
inner join Bibliotecario
on Prestamos.Bibliotecario_idBibliotecario=Bibliotecario.idBibliotecario
inner join  Detalle_Prestamo
on Prestamos.idPrestamo=Detalle_Prestamo.Prestamos_idPrestamo
inner join Libro
on Detalle_Prestamo.Libro_idLibro=Libro.idLibro
