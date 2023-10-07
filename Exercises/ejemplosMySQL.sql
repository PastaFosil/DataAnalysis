USE tienda;
SELECT count(nombre) AS "Pastas"
FROM articulo
WHERE nombre LIKE "Pasta%";

SELECT count(nombre) AS "Cannelloni"
FROM articulo
WHERE nombre LIKE "%Cannelloni%";

SELECT count(nombre) AS "Guiones"
FROM articulo
WHERE nombre LIKE "%-%";

SELECT nombre
FROM articulo
WHERE nombre LIKE BINARY "%ml%";

SELECT nombre
FROM articulo
WHERE nombre LIKE BINARY "%Ml%"; #LIKE BINARY revisa mayusculas y minusculas
/*
Para buscar con acentos (ignorandolos) se usa COLLATE utf8_bin, 
pero la base de datos debe estar configurada para eso, y mejor evitarlos
*/

SELECT min(precio)
FROM articulo;

-- Redondea el resultado a dos decimales
SELECT round(sum(precio), 2) FROM articulo;

/*
Al manejar bases de datos con precios, intentar escribirlos en centavos, 
o con tipos de datos que se limiten a dos o tres decimales,
para evitar errores de redondeo
*/

SELECT avg(salario) AS "salario promedio"
FROM puesto;

-- Numero de articulos con cafe o te en el nombre
SELECT count(nombre) AS "Cafes y tes"
FROM articulo;

SELECT max(salario) AS "Salario maximo"
FROM puesto;

SELECT avg(salario) AS "salario promedio"
FROM puesto;

-- Numero de articulos con cafe o te en el nombre
SELECT count(nombre) AS "Cafes y tes"
FROM articulo;

SELECT min(salario) AS "Salario minimo"
FROM puesto;

SELECT avg(salario)
FROM puesto
ORDER BY id_puesto DESC
LIMIT 5;

SELECT *
FROM articulo;