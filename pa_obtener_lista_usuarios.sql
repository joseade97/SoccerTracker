USE [progra5]
GO

CREATE PROCEDURE dbo.pa_obtener_lista_usuarios
	@identificacion varchar(20)
AS
BEGIN
	SELECT id_usuario,
	nombre_usuario,
	CASE WHEN es_admin = 1 THEN 'Administrador' ELSE 'Generico' END es_admin,
	CASE WHEN estado = 1 THEN 'Activo' ELSE 'Inactivo' END estado
	FROM Usuarios
END
GO
