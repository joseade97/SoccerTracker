CREATE FUNCTION dbo.fn_puntos()
RETURNS int 
AS
BEGIN
DECLARE 
@Resultado int

SET @Resultado = 
	(SELECT SUM(tPos.puntos) AS total
	FROM (
			SELECT CASE
					WHEN p.resultado = 'E' then
						1
					ELSE
						3
					END AS puntos
			FROM Partidos p
			WHERE (p.id_casa =1 and p.resultado = 'C')
				OR (p.id_visita = 1 and p.resultado = 'V')
				OR ((p.id_visita = 1 or p.id_casa = 1) and p.resultado = 'E')
		) as tPos)

	RETURN @Resultado

END
GO

