
/**** 1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? **/
SELECT countries.name, languages.language, languages.percentage
FROM languages
JOIN countries
ON languages.country_id = countries.id WHERE languages.language = 'Slovene' ORDER BY languages.percentage DESC;

/**** 2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? **/
SELECT countries.name, COUNT(cities.id) AS cities
FROM cities
JOIN countries 
ON countries.id = cities.country_id
GROUP BY countries.id
ORDER BY cities DESC;

/**** 3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000? **/
SELECT cities.name, cities.population, country_id
FROM countries
LEFT JOIN cities
ON countries.id = cities.country_id
WHERE countries.name = 'Mexico'
AND cities.population > 500000
ORDER BY cities.population DESC;

/**** 4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%? **/
SELECT countries.name, languages.language, languages.percentage
FROM countries
LEFT JOIN languages
ON countries.id = languages.country_id
WHERE percentage > 89
ORDER BY languages.percentage DESC;

/**** 5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000?  **/
SELECT countries.name, countries.surface_area, countries.population
FROM countries
WHERE countries.surface_area < 501
AND countries.population >100000;

/**** 6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? **/
SELECT countries.name, countries.government_form, countries.capital, countries.life_expectancy
FROM countries
WHERE countries.government_form = 'Constitutional Monarchy'
AND countries.capital > 200
AND countries.life_expectancy > 75;

/**** 7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? **/
SELECT countries.name, cities.name, cities.district, cities.population
FROM countries
LEFT JOIN cities
ON countries.id = cities.country_id
WHERE countries.name = 'Argentina'
AND cities.district = 'Buenos Aires'
AND cities.population > 500000;

/*** 8. ¿Qué consulta harías para resumir el número de países en cada región? **/
SELECT countries.region, COUNT(countries.region) AS countries
FROM countries
GROUP BY countries.region
ORDER BY countries DESC;