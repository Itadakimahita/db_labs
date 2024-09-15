
-- 1.
CREATE DATABASE lab1;

-- 2.
CREATE TABLE users (id SERIAL, firstname VARCHAR(50), lastname VARCHAR(50));

-- 3.
ALTER TABLE users ADD COLUMN isadmin INTEGER;

-- 4.
ALTER TABLE users ALTER COLUMN isadmin TYPE BOOLEAN USING (isadmin = 1);

-- 5.
ALTER TABLE users ALTER COLUMN isadmin SET DEFAULT FALSE;

-- 6.
ALTER TABLE users ADD PRIMARY KEY (id);

-- 7.
CREATE TABLE tasks (id SERIAL, name VARCHAR(50), user_id INTEGER);

-- INSERT INTO users values (5,'dias', 'kadyrov', true);
-- select * from users;

-- 8.
DROP TABLE tasks;

-- DROP TABLE users;

-- 9.
DROP DATABASE lab1;
