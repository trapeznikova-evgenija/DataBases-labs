CREATE DATABASE IF NOT EXISTS hotel_complex
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE hotel_complex;

SET CHARACTER_SET_SERVER = utf8;
SHOW VARIABLES LIKE 'character_set%';

/*CREATE TABLES*/

CREATE TABLE IF NOT EXISTS hotel
(
  id_hotel     INT(11) NOT NULL AUTO_INCREMENT,
  name         VARCHAR(255),
  number_start TINYINT,
  address      TEXT,
  PRIMARY KEY (id_hotel)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS room_kind
(
  id_room_kind  INT(11) NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(255),
  min_area      INT(11),
  PRIMARY KEY (id_room_kind)
)
  ENGINE = InnoDB;

SELECT *
FROM hotel;

INSERT room_kind (category_name, min_area)
VALUES ('люкс', 225),
  ('эконом', 100);

SHOW ENGINE INNODB STATUS;

CREATE TABLE IF NOT EXISTS room
(
  id_room      INT(11) NOT NULL AUTO_INCREMENT,
  id_hotel     INT(11),
  id_room_kind INT(11),
  room_number  INT(11),
  cost_day     INT(11),
  PRIMARY KEY (id_room),
  FOREIGN KEY (id_hotel) REFERENCES hotel (id_hotel),
  FOREIGN KEY (id_room_kind) REFERENCES room_kind (id_room_kind)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS client
(
  id_client INT(11) NOT NULL AUTO_INCREMENT,
  fio       TEXT,
  phone     VARCHAR(255),
  PRIMARY KEY (id_client)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS booking
(
  id_booking   INT(11) NOT NULL AUTO_INCREMENT,
  id_client    INT(11),
  booking_date DATE,
  PRIMARY KEY (id_booking),
  FOREIGN KEY (id_client) REFERENCES client (id_client)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS room_in_booking
(
  id_room_in_booking INT(11) NOT NULL AUTO_INCREMENT,
  id_booking         INT(11),
  id_room            INT(11),
  arrival_date       DATE,
  date_departure     DATE,
  PRIMARY KEY (id_room_in_booking),
  FOREIGN KEY (id_booking) REFERENCES booking (id_booking),
  FOREIGN KEY (id_room) REFERENCES room (id_room)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS category
(
  id_category   INT(11) NOT NULL AUTO_INCREMENT,
  category_name VARCHAR(255),
  PRIMARY KEY (id_category)
);

UPDATE hotel
SET name = 'Алтай'
WHERE id_hotel = 6;

DESCRIBE booking;

/*FILL TABLES*/

INSERT hotel
(name, number_start, address)
VALUES (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", CHAR(FLOOR(109 + RAND() * 11)),
               CHAR(FLOOR(109 + RAND() * 11))),
        FLOOR(1 + RAND() * 5), CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)))),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))),
   FLOOR(1 + RAND() * 5), CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)))),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))),
   FLOOR(1 + RAND() * 5), CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)))),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))),
   FLOOR(1 + RAND() * 5), CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)))),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))),
   FLOOR(1 + RAND() * 5), CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)))),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))),
   FLOOR(1 + RAND() * 5), CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)))),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))),
   FLOOR(1 + RAND() * 5), CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)))),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))),
   FLOOR(1 + RAND() * 5), CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26))));


SELECT *
FROM hotel;

SELECT *
FROM room_kind;
SELECT *
FROM room;

SHOW TABLES;
SELECT *
FROM booking;

SHOW TABLES;
SELECT *
FROM room;

INSERT room
(id_hotel, id_room_kind, room_number, cost_day)
VALUES
  (FLOOR(1 + RAND() * 24), FLOOR(1 + RAND() * 2), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 24), FLOOR(1 + RAND() * 2), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000));

INSERT client
(fio, phone)
VALUES (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
               CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
        '34312'),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   '3452'),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   '2823445314213'),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   '26276553');


INSERT booking
(id_client, booking_date)
VALUES (
  FLOOR(1 + RAND() * 29), CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31))
);

SELECT *
FROM room_in_booking;

SELECT *
FROM booking;
SELECT *
FROM room;

INSERT room_in_booking
(id_booking, id_room, arrival_date)
VALUES (
  FLOOR(1 + RAND() * 21), FLOOR(29 + RAND() * 86),
  CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31))
);

INSERT room_in_booking
(date_departure)
VALUES (CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31)));


UPDATE room_in_booking
SET date_departure = CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31))
WHERE id_room_in_booking = 49;

DELETE FROM room_in_booking
WHERE id_room_in_booking > 29;

SHOW TABLES;
SELECT *
FROM room_kind;

SELECT *
FROM room
WHERE id_hotel = 6;

UPDATE room_in_booking
SET id_room = 57
WHERE id_room_in_booking = 18;

SELECT *
FROM hotel;
UPDATE hotel
SET name = 'Сокол'
WHERE id_hotel = 23;

SELECT *
FROM room
WHERE id_hotel = 12;

SELECT *
FROM room_in_booking
WHERE id_room = 82;

UPDATE room_in_booking
SET id_room = 82
WHERE id_room_in_booking = 13;


/*REQUESTS*/

SELECT *
FROM hotel;

SELECT *
FROM room_in_booking;

SELECT *
FROM room
WHERE id_room = 82;

UPDATE room
SET id_room_kind = 1
WHERE id_room = 82;

SELECT *
FROM room_in_booking;

UPDATE room_in_booking
SET date_departure = '2018-06-9'
WHERE id_room_in_booking = 13;


/* 1.Выдать информацию о клиентах гостиницы “Алтай”, проживающих в номерах категории “люкс” на сегодня. */


CREATE INDEX IN_hotel_number ON hotel (name);
CREATE INDEX IN_category_name ON room_kind (category_name);
CREATE INDEX IN_arrival_date ON room_in_booking (arrival_date);
CREATE INDEX IN_date_departure ON room_in_booking (date_departure);

/* 2.Дать список свободных номеров всех гостиниц на 30.05.12.*/
EXPLAIN SELECT
  hotel.name AS hotel_name,
  room.room_number
FROM room
  LEFT JOIN room_in_booking ON room_in_booking.id_room = room.id_room
  INNER JOIN hotel ON room.id_hotel = hotel.id_hotel
WHERE '2012-05-30' NOT BETWEEN room_in_booking.date_departure AND room_in_booking.arrival_date;

/* 3.Дать количество проживающих в гостинице “Восток” на 25.05.12 по каждой категории номеров */
EXPLAIN SELECT
  room_kind.category_name,
  COUNT(room_kind.id_room_kind) AS count_of_quests
FROM room_in_booking
  LEFT JOIN room ON room_in_booking.id_room = room.id_room
  LEFT JOIN room_kind ON room.id_room_kind = room_kind.id_room_kind
  LEFT JOIN hotel ON room.id_hotel = hotel.id_hotel
WHERE '2012-05-25' BETWEEN room_in_booking.arrival_date AND room_in_booking.date_departure
      AND hotel.name = 'Восток'
GROUP BY room_kind.category_name;


/*4. Дать список последних проживавших клиентов по всем комнатам гостиницы “Космос”,
 выехавшим в апреле 2012 с указанием даты выезда. */
CREATE TEMPORARY TABLE IF NOT EXISTS room_and_departure_date
(
  id         INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_room    INT(11),
  departure_date DATE
);

TRUNCATE room_and_departure_date;

INSERT INTO room_and_departure_date (id_room, departure_date)
SELECT
    room_in_booking.id_room,
    MAX(room_in_booking.date_departure)
  FROM room_in_booking
    LEFT JOIN room ON room.id_room = room_in_booking.id_room
    LEFT JOIN hotel ON room.id_hotel = hotel.id_hotel
    LEFT JOIN booking ON room_in_booking.id_booking = booking.id_booking
    LEFT JOIN client ON booking.id_client = client.id_client
  WHERE MONTH(room_in_booking.date_departure) = 4 AND hotel.name = 'Космос'
  GROUP BY room_in_booking.id_room;

SELECT room_and_departure_date.departure_date, client.fio
FROM room_and_departure_date
LEFT JOIN room_in_booking ON room_in_booking.id_room = room_and_departure_date.id_room
LEFT JOIN booking ON room_in_booking.id_booking = booking.id_booking
LEFT JOIN client ON booking.id_client = client.id_client;

/*5. Продлить до 30.05.12 дату проживания в гостинице “Сокол” всем клиентам комнат категории “люкс”,
 которые заселились 15.05.12, а выезжают 28.05.12 */
UPDATE room_in_booking
  LEFT JOIN room ON room_in_booking.id_room = room.id_room
  LEFT JOIN hotel ON room.id_hotel = hotel.id_hotel
  LEFT JOIN room_kind ON room.id_room_kind = room_kind.id_room_kind
SET room_in_booking.date_departure = '2012-05-30'
WHERE hotel.name = 'Сокол' AND room_kind.category_name = 'люкс'
      AND room_in_booking.date_departure = '2012-05-28' AND room_in_booking.arrival_date = '2012-05-15';

SELECT *
FROM
  room_in_booking
  LEFT JOIN room ON room_in_booking.id_room = room.id_room
  LEFT JOIN hotel ON room.id_hotel = hotel.id_hotel
  LEFT JOIN room_kind ON room.id_room_kind = room_kind.id_room_kind
WHERE hotel.name = 'Сокол' AND room_kind.category_name = 'люкс'
      AND room_in_booking.date_departure = '2012-05-28' AND room_in_booking.arrival_date = '2012-05-15';

SELECT LAST_INSERT_ID();
SELECT * FROM room_in_booking;

/* 6. Привести пример транзакции при создании брони. */
START TRANSACTION;
SET @id_client = 19;
INSERT INTO booking VALUES (NULL, @id_client, '2018-05-18');
SET @last_booking = LAST_INSERT_ID();
INSERT INTO room_in_booking VALUES (NULL, @last_booking, 34, '2018-05-30', '2018-06-12');
COMMIT;

SELECT *
FROM room_in_booking;