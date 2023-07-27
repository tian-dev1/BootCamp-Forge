/* 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012? */
SELECT MONTHNAME(charged_datetime) as month,
       SUM(amount) as total_amount
FROM `billing` 
WHERE YEAR(charged_datetime)=2012 && MONTH(charged_datetime)=03;

/* 2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2? */
SELECT c.client_id,  SUM(b.amount) as total_amount
FROM billing b
INNER JOIN clients c
ON b.client_id = c.client_id
WHERE c.client_id=2;

/* 3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10? */
SELECT  s.domain_name as website, c.client_id
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
WHERE c.client_id=10;

/* 4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? ¿Qué pasa con el cliente = 20? */
SELECT 
    clients.client_id,
    COUNT(sites.site_id) AS sites_created,
    MONTH(sites.created_datetime) AS 'month',
    YEAR(sites.created_datetime) AS 'year'
FROM
    clients
        JOIN
    sites ON clients.client_id = sites.client_id
        AND clients.client_id = 1
GROUP BY MONTH(sites.created_datetime) , YEAR(sites.created_datetime)
ORDER BY MONTH(sites.created_datetime) ASC;
	
/* 5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011? */
SELECT s.domain_name as website, COUNT(l.leads_id) as count_leads, 
	   DATE_FORMAT(l.registered_datetime, "%M %d, %Y")as date_generate
FROM sites s
INNER JOIN leads l
ON s.site_id = l.site_id
WHERE l.registered_datetime >= "2011/01/01" && 
	  l.registered_datetime <="2011/02/15"
GROUP BY s.site_id;

/* 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? */
SELECT c.first_name, c.last_name, COUNT(l.leads_id) as count_leads
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
INNER JOIN leads l
ON l.site_id= s.site_id
WHERE l.registered_datetime >= "2011/01/01" && 
	  l.registered_datetime <="2011/12/31"
GROUP BY c.client_id; 

/* 7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada cliente cada mes entre los meses 1 y 6 del año 2011? */
SELECT c.first_name, c.last_name, COUNT(l.leads_id) as count_leads, 
       MONTHNAME(l.registered_datetime) as month
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
INNER JOIN leads l
ON l.site_id= s.site_id
WHERE YEAR(l.registered_datetime) = 2011 && 
	  MONTH(l.registered_datetime) >= 1 &&  MONTH(l.registered_datetime) <= 6
GROUP BY s.site_id
ORDER BY MONTH(l.registered_datetime), c.client_id;

/* 8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de los sitios de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente. Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total de clientes potenciales generados en cada sitio en todo momento */
SELECT c.first_name, c.last_name, s.domain_name, 
       COUNT(l.site_id) as count_leads, MONTHNAME(l.registered_datetime) as month
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
INNER JOIN leads l
ON l.site_id= s.site_id
WHERE YEAR(l.registered_datetime) = 2011
GROUP BY s.domain_name
ORDER BY c.client_id, MONTH(l.registered_datetime);

SELECT c.first_name, c.last_name, s.domain_name, COUNT(l.site_id) as count_leads
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
INNER JOIN leads l
ON l.site_id= s.site_id
GROUP BY s.domain_name
ORDER BY c.client_id, count_leads DESC; 

/* 9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente. */
SELECT c.first_name, c.last_name, SUM(b.amount) as total_amount, 
       DATE_FORMAT(b.charged_datetime, "%M %Y") as month_year
FROM billing b
INNER JOIN clients c
ON b.client_id = c.client_id
GROUP BY c.client_id, month_year
ORDER BY c.client_id, YEAR(b.charged_datetime), MONTH(b.charged_datetime);

/* 10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente. Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT) */
SELECT CONCAT(c.first_name, c.last_name) as client_name, 
       GROUP_CONCAT(s.domain_name SEPARATOR" / ") as sites 
FROM sites s
INNER JOIN clients c
ON s.client_id = c.client_id
GROUP BY c.client_id;