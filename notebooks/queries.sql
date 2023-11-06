-- DISTRITO CON LA POBLACIÓN MÁS ALTA Y SU RENTA MEDIA --

SELECT p.Distrito, MAX(p.Poblacion) AS PoblacionMaxima, AVG(r.`Renta media p/p (neto)`) AS RentaMedia
FROM madrid.poblacion p
INNER JOIN madrid.rentas r ON p.Distrito = r.Distrito
GROUP BY p.Distrito
ORDER BY PoblacionMaxima DESC
LIMIT 1;

-- CASAS EN DISTRITOS CON MÁS DE 5 HABITACIONES ORDENADAS POR ORDEN DESCENDIENTE EN RELACIÓN A SU SUPERFICIE(M2) --

SELECT c.*
FROM madrid.casas c
JOIN madrid.distritos d ON c.Distrito = d.Distrito
WHERE c.Habitaciones > 5
ORDER BY `Superficie(m2)` DESC;

-- ENCUENTRA EL DISTRITO CON EL PROMEDIO MÁS ALTO DE PRECIO PARA CASAS CON PISCINA --

SELECT Distrito, AVG(Precio) AS Precio_Promedio
FROM casas
WHERE Piscina = 1
GROUP BY Distrito
HAVING AVG(Precio) = (SELECT MAX(AVG_Precio) FROM (SELECT Distrito, AVG(Precio) AS AVG_Precio FROM casas WHERE Piscina = 1 GROUP BY Distrito) AS subquery);

-- ENCUENTRA EL DISTRITO CON MAYOR NÚMERO DE HABITANTES EN RELACIÓN A SU DENSIDAD --

SELECT Distrito, `Densidad (Hab./ha)` AS Densidad
FROM poblacion
WHERE `Densidad (Hab./ha)` = (SELECT MAX(`Densidad (Hab./ha)`) FROM poblacion);