USE [progra5]
GO

CREATE PROCEDURE dbo.pa_RetornaPosiciones
AS
BEGIN
	SELECT nombre, dbo.fn_puntos() pts
	FROM Equipos e
	INNER JOIN Equipos_x_Campeonato ec ON e.id = ec.id_equipo
	JOIN Campeonatos c ON c.id = ec.id_campeonato
	ORDER BY dbo.fn_puntos() ASC
END
GO