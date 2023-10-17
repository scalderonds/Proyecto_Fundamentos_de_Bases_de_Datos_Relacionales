-- Insertar customer:
INSERT INTO customer (store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (1, 'Customer', 'Insertado', 'ci@gmail.com', 1, true, current_date, current_timestamp, 1);

-- Modificar customer:
UPDATE customer
SET store_id = 2,
    first_name = 'Customer',
    last_name = 'Modificado',
    email = 'cm@gmail.com',
    address_id = 2,
    activebool = false,
    create_date = '2023-06-13',
    last_update = current_timestamp,
    active = 0
WHERE customer_id = 1;

-- Eliminar customer:
DELETE FROM payment
WHERE customer_id = 2;
DELETE FROM rental
WHERE customer_id = 2;
DELETE FROM customer
WHERE first_name = 'Patricia' AND last_name = 'Johnson';

-- Insertar staff:
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password)
VALUES ('Staff', 'Insertado', 1, 'si@gmail.com', 1, true, 'staffinsertado', 'password123');

-- Modificar staff:
UPDATE staff
SET first_name = 'Staff', last_name = 'Modificado', email = 'sm@gmail.com'
WHERE staff_id = 1;

-- Eliminar staff:
DELETE FROM payment
WHERE staff_id = 2;

DELETE FROM payment
WHERE rental_id IN (
  SELECT rental_id
  FROM rental
  WHERE staff_id = 2
);
DELETE FROM rental
WHERE staff_id = 2;

DELETE FROM store
WHERE manager_staff_id = 2;

DELETE FROM staff
WHERE username = 'Jon';

-- Insertar actor:
INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Actor', 'Insertado', NOW());

-- Modificar actor:
UPDATE actor
SET first_name = 'Actor', last_name = 'Modificado'
WHERE actor_id = 1;

-- Eliminar actor:
DELETE FROM film_actor
WHERE actor_id = 2;
DELETE FROM actor
WHERE actor_id = 2;

-- Listar todas las “rental” con los datos del “customer” dado un año y mes:
SELECT r.rental_id, r.rental_date, c.first_name, c.last_name
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM r.rental_date) = 2005
  AND EXTRACT(MONTH FROM r.rental_date) = 7;
  
-- Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”:
SELECT payment_id AS "Número", payment_date AS "Fecha", amount AS "Total"
FROM payment;

-- Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0:
SELECT *
FROM film
WHERE release_year = 2006 AND rental_rate > 4.0;

-- Realizar un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente:
SELECT
 t1.TABLE_NAME AS tabla_nombre,
 t1.COLUMN_NAME AS columna_nombre,
 t1.IS_NULLABLE AS columna_nulo,
 t1.DATA_TYPE AS columna_tipo_dato
FROM
 INFORMATION_SCHEMA.COLUMNS t1
 INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE
 t1.TABLE_SCHEMA = 'public'
ORDER BY
 t1.TABLE_NAME;





















