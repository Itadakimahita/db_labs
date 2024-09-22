-- 1
CREATE DATABASE lab2;

-- 2
CREATE TABLE countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR,
    region_id INT,
    population INT
);

-- 3
INSERT INTO countries (country_name, region_id, population) 
VALUES ('Indonesia', 1, 10000); 

-- 4
INSERT INTO countries (country_id, country_name) 
VALUES (default, 'South Korea');

-- 5
INSERT INTO countries (region_id) VALUES (NULL); 

-- 6
INSERT INTO countries (country_name, region_id, population) 
VALUES  
('Japan', 2, 125100000),
('China', 3, 1412000000),
('Singapore', 4, 5637000);

-- 7
ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

-- 8
INSERT INTO countries (country_name, region_id, population) 
VALUES (default, 1, 3000000);

-- 9
INSERT INTO countries DEFAULT VALUES;

-- 10
CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

-- 11
INSERT INTO countries_new SELECT * FROM countries;

-- 12
UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

-- 13
UPDATE countries SET population = population * 1.1 RETURNING country_name, population AS "New population";

-- 14
DELETE FROM countries WHERE population < 100000;

-- 15
DELETE FROM countries_new 
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

-- 16
DELETE FROM countries RETURNING *;
