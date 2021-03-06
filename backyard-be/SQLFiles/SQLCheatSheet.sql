-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'backyard';
-- SELECT * FROM users;
-- INSERT INTO users(first_name, last_name, email, password, city, bio, registered_date) VALUES 
-- ('Brian', 'Maclean', 'briann@verizon.com', '34567', 'Irvine', 'Hi, I am Brian', now()),
-- ('Maya', 'Goody', 'maya@gmail.com', '234556', 'Truckee', 'Hi, I am Maya', now()),
-- ('Yvette', 'Bell', 'yvette@gmail.com', '56789', 'Truckee', 'Hi, I am Yvette', now()),
-- ('Pat', 'Eger', 'pat@gmail.com', '89012', 'Truckee', 'Hi, I am Pat', now()),
-- ('Danny', 'Sandoval', 'danny@gmail.com', '78901', 'Reno', 'Hi, I am Danny', now());
-- DELETE FROM users WHERE first_name='Andrew';
-- UPDATE users SET email = 'brian@verizon.net' WHERE first_name = 'Brian';
-- ALTER TABLE users ADD creator INT;
-- ALTER TABLE users MODIFY COLUMN creator INT;
-- UPDATE users SET creator = 3;
-- SELECT * FROM users ORDER BY last_name DESC;
-- SELECT CONCAT(first_name, ' ', last_name) AS 'name', email FROM users;
-- SELECT DISTINCT city FROM users;
-- SELECT * FROM users WHERE id BETWEEN 4 AND 7;
-- SELECT * FROM users WHERE email LIKE '%gmail%';
-- SELECT * FROM users WHERE city IN('Reno', 'Irvine');
-- CREATE INDEX cityIndex on users(city);
-- DROP INDEX cityIndex on users;

-- CREATE TABLE adventures(
--     id INT AUTO_INCREMENT,
--     adventure_type VARCHAR(100),
--     adventure_name VARCHAR(100),
--     approach_distance FLOAT,
--     season VARCHAR(50),
--     avg_angle INT,
--     max_angle INT,
--     difficulty VARCHAR(50),
--     elevation FLOAT,
--     gear VARCHAR(100),
--     gain INT,
--     bio TEXT,
--     nearest_city VARCHAR(255),
--     creator_id INT,
--     coordinates_lat FLOAT,
--     coordinates_lng FLOAT,
--     PRIMARY KEY(id),
--     FOREIGN KEY(creator_id) REFERENCES users(id)
-- );

-- INSERT INTO adventures(adventure_name, approach, season, avg_angle, max_angle, dificulty, elevation, gear, gain, bio, city, creator_id) VALUES 
-- ('Donner Peak', '2.5', '1, 2, 3, 4, 5, 12', 25, 45, 2, 6500, '', 1500, 'Donner Peak is pretty fun to ski', 'Truckee', 3),
-- ('Castle Peak', '3.5', '1, 2, 3, 4, 5, 12', 25, 45, 1, 7000, '', 1500, 'Castle Peak is pretty fun to ski', 'Truckee', 3),
-- ('Schalenberger', '0.5', '1, 2, 3, 4, 5, 12', 25, 35, 1, 6000, '', 1200, 'Schalenberger Ridge is pretty short to ski', 'Truckee', 3),
-- ('Mount Judah', '3.5', '1, 2, 3, 4, 5, 6, 12', 35, 45, 2, 7000, '', 1000, 'Mount Judah is pretty fun to ski', 'Truckee', 3);

-- SELECT
-- users.first_name,
-- users.last_name,
-- users.email,
-- adventures.adventure_name,
-- adventures.bio,
-- adventures.city
-- FROM adventures
-- INNER JOIN users
-- ON adventures.creator_id = users.id;

-- CREATE TABLE activities(
--     id INT AUTO_INCREMENT,
--     user_id INT,
--     adventure_id INT,
--     added_date DATETIME DEFAULT CURRENT_TIMESTAMP,
--     PRIMARY KEY(id),
--     FOREIGN KEY(user_id) REFERENCES users(id),
--     FOREIGN KEY(adventure_id) REFERENCES adventures(id)
-- );

-- INSERT INTO activities(user_id, adventure_id) VALUES 
-- (3, 4),
-- (5, 2),
-- (7, 1),
-- (8, 3),
-- (4, 2),
-- (6, 1);

-- SELECT
-- users.first_name,
-- users.last_name,
-- users.email,
-- adventures.adventure_name,
-- adventures.city
-- FROM activities
-- INNER JOIN users ON users.id = activities.user_id
-- INNER JOIN adventures ON adventures.id = activities.adventure_id
-- WHERE activities.adventure_id = 2;

-- SELECT MAX(dificulty) FROM adventures;
-- SELECT COUNT(id) FROM adventures;
-- SELECT UCASE(first_name), LCASE(last_name) FROM users;
-- SELECT city, COUNT(city) FROM users GROUP BY city;
-- SELECT city, COUNT(city) FROM users WHERE city = 'Reno' GROUP BY city;

-- CREATE TABLE adventures(
--     id
--     type
--     adventure_name,
--     approach_distance,
--     season,
--     avg_angle,
--     max_angle,
--     difficulty,
--     elevation,
--     gear,
--     gain,
--     bio,
--     nearest_city,
--     creator_id,
--     coordinates_lat
--     coordinates_lng

CREATE TABLE ticks(
    id INT AUTO_INCREMENT,
    user_id INT,
    adventure_id INT,
    date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(adventure_id) REFERENCES adventures(id)
);