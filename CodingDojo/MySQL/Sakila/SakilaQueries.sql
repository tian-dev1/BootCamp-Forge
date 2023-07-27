
/* 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? */
SELECT address.city_id AS city_id, customer.first_name AS first_name, customer.last_name AS last_name, customer.email, address.address
    FROM customer
    JOIN address ON customer.address_id = address.address_id
    WHERE address.city_id = 312;

/* 2. ¿Qué consulta harías para obtener todas las películas de comedia? */
SELECT * FROM film
    JOIN film_category ON film.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    WHERE category.name = 'Comedy';
    
/* 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? */
SELECT film_actor.actor_id AS actor_id, film.title, film.description, film.release_year
    FROM film
    JOIN film_actor ON film.film_id = film_actor.film_id
    WHERE film_actor.actor_id = 5;
    
/* 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? */
SELECT city.city_id, store.store_id, customer.first_name, customer.last_name, customer.email, address.address
    FROM customer
    JOIN store ON customer.store_id = store.store_id
    JOIN address ON customer.address_id = address.address_id
    JOIN city ON address.city_id = city.city_id
    WHERE store.store_id = 1 AND city.city_id IN (1, 42, 312, 459);
    
/* 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15? */
SELECT film.title, film.description, film.release_year, film.rating, film.special_features 
    FROM film
    JOIN film_actor ON film_actor.film_id = film.film_id
    WHERE film.rating = "G" AND actor_id = 15 AND film.special_features LIKE "%Behind the Scenes%";
    // % are used as wildcards;

/* 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? */
SELECT film.film_id, film.title, actor.actor_id, CONCAT(actor.first_name, ' ', actor.last_name) AS actor_name
	FROM film
	JOIN film_actor ON film.film_id = film_actor.film_id
	JOIN actor ON film_actor.actor_id = actor.actor_id
	WHERE film_actor.film_id = 369;
    
/* 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? */
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name, film.rental_rate
    FROM film
    JOIN film_category ON film.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    WHERE film.rental_rate = 2.99 AND category.name='drama';
    
/* 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? */
 SELECT CONCAT(actor.first_name, ' ', actor.last_name) AS actor_name, film.title, film.description, film.release_year, film.rating, film.special_features, category.name AS genre
    FROM film
    JOIN film_category ON film.film_id = film_category.film_id
    JOIN category ON film_category.category_id = category.category_id
    JOIN film_actor ON film.film_id = film_actor.film_id
    JOIN actor ON film_actor.actor_id = actor.actor_id
    WHERE category.name = 'action' AND actor.first_name ='Sandra' AND actor.last_name = 'Kilmer';