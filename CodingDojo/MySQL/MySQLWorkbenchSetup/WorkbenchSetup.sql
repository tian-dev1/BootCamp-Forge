CREATE DATABASE example;
USE example;
CREATE TABLE persons (
    person_id int primary key auto_increment,
    last_name varchar(255),
    first_name varchar(255),
    address varchar(255),
    city varchar(255)
);
INSERT INTO persons (last_name, first_name, address, city) 
	VALUES ('Arevalo', 'Cristian', 'Cll 123', 'Bogotá'),
			('Perdomo', 'Camilo', 'Cll 321', 'Medellin');
            
SELECT * FROM persons;
UPDATE persons SET city = 'Cali' WHERE person_id = 2;
SELECT * FROM persons WHERE city = 'Cali';
DELETE FROM persons WHERE person_id = 1;
SELECT * FROM persons;
            