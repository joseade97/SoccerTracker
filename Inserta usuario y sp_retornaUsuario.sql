insert Usuarios (nombre_usuario, hashed_pass, es_admin, estado, id_persona)
values('joseade97','123456',1,1,4)

go

CREATE PROCEDURE sp_RetornaUsuarioNombrePwd
@nombre_usuario [varchar](50),
@contrasena [varchar](100)
AS
	
SELECT [id_usuario],[nombre_usuario],[hashed_pass],[es_admin],[estado],[id_persona]
FROM [Usuarios]
WHERE [hashed_pass]=@contrasena and [nombre_usuario]=@nombre_usuario

go

CREATE PROCEDURE sp_RetornaUsuarioID
@id_usuario int
AS
	
SELECT [id_usuario],[nombre_usuario],[hashed_pass],[es_admin],[estado],[id_persona]
FROM [Usuarios]
WHERE [id_usuario]=@id_usuario

go

CREATE PROCEDURE sp_RetornaUsuario
@nombre_usuario [varchar](50)=NULL,
@id_Usuario int=NULL

AS
	
SELECT [id_usuario],[nombre_usuario],[hashed_pass],[es_admin],[estado],[id_persona]
FROM [Usuarios]
WHERE  [nombre_usuario] like (case when @nombre_usuario is null then '%%' else '%'+nombre_usuario+'%' end)
and [id_usuario] = (case when @id_usuario is null then [id_Usuario] else @id_usuario end)