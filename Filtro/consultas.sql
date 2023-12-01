DELIMITER //
CREATE Procedure torneo_composicion_resultados(in anyo INT, in Torneo INT)
BEGIN
    SELECT p1.*, p2.* FROM partido_1_1 p1
        JOIN jugador j ON p1.Jugador1 = j.Nombre_Completo OR p1.Jugador2 = j.Nombre_Completo
        JOIN Pais pa ON pa.Nombre = j.Pais 
        JOIN torneo t ON pa.Nombre = t.Pais_anfitrion 
        JOIN equipo e ON j.Nombre_Completo = e.Jugador1 OR j.Nombre_Completo = e.Jugador2
        JOIN partido_2_2 p2 ON e.id = p2.Equipo1 OR e.id = p2.Equipo2 
    WHERE  t.anyo = anyo AND t.id = Torneo
    GROUP BY p1.id, p1.Fase, p1.Jugador1, p1.Jugador2, p1.Resultado, p1.Tipo, p2.id, p2.Fase, p2.Equipo1, p2.Equipo2, p2.Resultado, p2.Tipo;
END //

DELIMITER ;

CALL torneo_composicion_resultados(2023, 1);

SELECT * FROM arbitros

DELIMITER //
CREATE Procedure jugador_ganancias
BEGIN
    SELECT FROM jugador j
    JOIN partido_1_1 p1 ON j.nombre_completo  = p1.Jugador1 OR j.nombre_Completo = p1.Jugador2
    JOIN equipo e ON j.p2Nombre_Completop2 = e.p2Jugador1p2 OR j.p2Nombre_Completop2 = e.p2Jugador2p2
    JOIN partido_2_2 p2 ON e.id  = p2.Equipo1 OR e.id = p2.Equipo2
    JOIN