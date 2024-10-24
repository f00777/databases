--1)Listar los nombres de todos los jugadores con una altura mayor a 2 metros
SELECT nombre, altura FROM Jugadores WHERE altura > 2.00;

--2) Listar los nombres de los árbitros que han arbitrado un partido específico (por ejemplo, partido con ID 9).
SELECT nombre FROM Arbitros A JOIN Arbitros_Partidos AP ON A.id_arbitro = AP.id_arbitro
WHERE AP.id_partido = 5;

--3) Listar los árbitros que tienen menos de 3 años de experiencia.
SELECT * FROM Arbitros WHERE experiencia < 3;

--4)Obtener la cantidad de partidos jugados en cada ciudad.
SELECT ciudad, count(*) as veces_jugadas FROM Partidos p JOIN Equipos e ON p.id_equipo_local = e.id_equipo
GROUP BY ciudad;

--5)Mostrar los nombres de los equipos y la cantidad total de jugadores que tienen.
SELECT E.nombre, count(J.nombre) as Jugadores From Jugadores J JOIN Equipos E 
ON J.id_equipo = E.id_equipo GROUP BY E.nombre;

--6)Listar los jugadores que hayan jugado en más de 10 partidos en una temporada.
Select t.nombre, t.partidos_jugados FROM (SELECT J.nombre, count(*) as partidos_jugados 
from Jugadores J JOIN Estadisticas_Jugador_Partido EJP 
ON EJP.id_jugador = J.id_jugador 
JOIN Partidos p on p.id_equipo_visitante = J.id_equipo 
OR p.id_equipo_local = J.id_equipo
WHERE p.fecha BETWEEN "2024-01-01" AND "2025-01-01" GROUP BY J.nombre) as t
WHERE t.partidos_jugados > 10 ;

--7)Listar todos los jugadores nacidos antes del año 2000.
SELECT * FROM Jugadores WHERE fecha_nacimiento < "2000-01-01";

--8)Consultar el número de partidos que ha jugado un equipo como visitante (por ejemplo, equipo con ID 2).
SELECT COUNT(*) FROM Partidos WHERE id_equipo_visitante = 2;

--9)Listar los partidos en los que un equipo (por ejemplo, con ID 3) haya jugado y el margen de puntos haya sido de 5 o menos.
SELECT * FROM Partidos WHERE (id_equipo_local = 3 
OR id_equipo_visitante = 3)
AND (resultado_visitante - resultado_local >= 5 
OR resultado_visitante - resultado_local <= -5);

--10)Obtener los nombres de todos los equipos y su división.
SELECT nombre, division FROM Equipos;

--11)Obtener el jugador con el mayor número de asistencias en un partido específico (por ejemplo, partido con ID 4).
SELECT j.id_jugador, j.nombre FROM Jugadores j JOIN Estadisticas_Jugador_Partido ejp
on j.id_jugador = ejp.id_jugador WHERE ejp.asistencias = (SELECT MAX(asistencias) 
FROM Estadisticas_Jugador_Partido ejp
WHERE ejp.id_partido = 4) AND ejp.id_partido = 4;

--12)Listar los equipos que pertenecen a la misma conferencia y divinión que un equipo específico (por ejemplo, equipo con ID 3).
SELECT * FROM Equipos
WHERE conferencia = (SELECT conferencia FROM Equipos WHERE id_equipo = 3 ) 
AND division = (SELECT division FROM Equipos WHERE id_equipo = 3);

--13)Listar los partidos en los que el equipo local ganó por más de 15 puntos.
SELECT * FROM Partidos WHERE (resultado_local - resultado_visitante) > 15;

--14)Obtener los jugadores que hayan anotado más de 10 puntos y hayan jugado más de 30 minutos en un mismo partido
SELECT j.nombre FROM Jugadores j JOIN Estadisticas_Jugador_Partido ejp
ON ejp.id_jugador = j.id_jugador 
WHERE ejp.puntos > 10 AND ejp.minutos_jugados > 30; 

--15)Listar los equipos que nunca han perdido un partido como locales.
SELECT nombre FROM Equipos WHERE nombre NOT IN (SELECT e.nombre FROM Equipos e JOIN Partidos p 
ON e.id_equipo = p.id_equipo_local 
WHERE p.resultado_local < p.resultado_visitante);

--16)Listar los jugadores que hayan participado en partidos arbitrados por un árbitro específico (por ejemplo, árbitro con ID 6) y que hayan anotado más de 15 puntos
SELECT j.name FROM Jugadores j JOIN Estadisticas_Jugador_Partido ejp
ON j.id_jugador = ejp.id_jugador 
JOIN Arbitros_Partidos ap on ap.id_partido = ejp.id_partido 
WHERE ap.id_arbitro = 3 AND ejp.puntos > 15;  

--17)Listar los jugadores que hayan participado en partidos arbitrados por árbitros con más de 10 años de experiencia.
SELECT j.nombre FROM Jugadores j JOIN Estadisticas_Jugador_Partido ejp
ON j.id_jugador = ejp.id_jugador
JOIN Arbitros_Partidos ap ON ap.id_partido = ejp.id_partido
JOIN Arbitros a ON ap.id_arbitro = a.id_arbitro
WHERE a.experiencia > 10; 

--18)Consultar el nombre y peso de un jugador específico (por ejemplo, jugador con ID 7).
SELECT nombre, peso FROM Jugadores WHERE id = 7;

--19)Obtener el jugador que ha jugado más minutos en toda la temporada.
SELECT j.nombre, SUM(ejp.minutos_jugados) 
as minutos_temporada FROM Jugadores j JOIN Estadisticas_Jugador_Partido ejp 
ON j.id_jugador = ejp.id_jugador 
GROUP BY j.nombre ORDER BY minutos_temporada DESC 
LIMIT 1;

--20)Listar los partidos en los que el equipo visitante ganó por más de 10 puntos.
SELECT p.id_partido, p.resultado_local, p.resultado_visitante
FROM Partidos p WHERE p.resultado_visitante - p.resultado_local > 10;

--21)Obtener el promedio de rebotes por partido de los jugadores que juegan como pivote ("Center').
SELECT j.nombre, AVG(ejp.rebotes) as promedo FROM Jugadores j JOIN Estadisticas_Jugador_Partido ejp
ON j.id_jugador = ejp.id_jugador 
WHERE j.posicion = 'Pívot'
GROUP BY j.nombre;

--22)Obtener el total de puntos acumulados por todos los equípos en los partidos jugados como visitantes.
SELECT e.nombre, SUM(p.resultado_visitante) as suma FROM Equipos e 
JOIN Partidos p ON e.id_equipo = p.id_equipo_visitante 
GROUP BY e.nombre;

--23)Obtener el equipo con la mayor cantidad de partidos ganados como visitante
SELECT e.nombre, COUNT(*) as ganados FROM Equipos e 
JOIN Partidos p ON e.id_equipo = p.id_equipo_visitante
WHERE p.resultado_visitante > p.resultado_local
GROUP BY e.nombre
ORDER BY ganados DESC
LIMIT 1;

--24)Obtener la cantidad total de faltas cometidas por un jugador en todos los partidos de una temporada.
SELECT j.nombre, SUM(ejp.faltas) as faltas_temporada FROM Jugadores j
JOIN Estadisticas_Jugador_Partido ejp ON j.id_jugador= ejp.id_jugador
JOIN Partidos p ON ejp.id_partido = p.id_partido
WHERE p.fecha BETWEEN "2023-12-31" AND "2024-12-31"
GROUP BY j.nombre;

--25)Obtener el jugador con la mayor cantidad de robos en todos los partidos de la temporada.
SELECT j.nombre, SUM(ejp.robos) as robos_temporada FROM Jugadores j
JOIN Estadisticas_Jugador_Partido ejp ON j.id_jugador = ejp.id_jugador
JOIN Partidos p on p.id_partido = ejp.id_partido
WHERE p.fecha BETWEEN "2023-12-31" AND "2024-12-31"
GROUP BY j.nombre ORDER BY robos_temporada DESC LIMIT 1;

--26)Obtener el total de puntos de un partido específico (Por ejemplo con ID 8)
SELECT id_partido, (resultado_local + resultado_visitante) 
as Total_puntos FROM Partidos WHERE id_partido = 5;

--27)Obtener el promedio de puntos por partido de todos los jugadores que juegan en una posición específica (por ejemplo, 'Base').
SELECT j.nombre, AVG(ejp.puntos) as promedio_puntos FROM Jugadores j 
JOIN Estadisticas_Jugador_Partido ejp ON ejp.id_jugador = j.id_jugador
WHERE j.posicion = 'BASE'
GROUP BY j.nombre;


--28)Obtener los árbitros que hayan arbitrado más de 15 partidos en una temporada
SELECT a.nombre, t.veces_arbitradas FROM
    (SELECT a.id, COUNT(*) as veces_arbitradas FROM Arbitros a 
    JOIN Arbitros_Partidos ap ON a.id_arbitro = ap.id_arbitro
    GROUP BY a.id) as t 
JOIN Arbitros a ON t.id = a.id
WHERE t.veces_arbitradas > 15;

--29)Obtener el nombre y ciudad de todos los equipos de la conferencia 'Este'.
SELECT nombre, ciudad FROM Equipos WHERE conferencia = 'Este';

--30)Listar los partidos que fueron jugados en un lugar específico (por ejemplo, "Madison Square Garden").
SELECT * FROM Partidos WHERE lugar = 'Madison Square Garden';