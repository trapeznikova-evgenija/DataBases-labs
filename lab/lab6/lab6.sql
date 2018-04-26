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
  id_room_kind INT(11) NOT NULL AUTO_INCREMENT,
  name         INT(11),
  min_area     INT(11),
  PRIMARY KEY (id_room_kind)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS room
(
  id_room      INT(11) NOT NULL AUTO_INCREMENT,
  id_hotel     INT(11),
  id_room_kind INT(11),
  room_number  INT(11),
  cost_day     INT(11),
  PRIMARY KEY (id_room)
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
  PRIMARY KEY (id_booking)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS room_in_booking
(
  id_room_in_booking INT(11) NOT NULL AUTO_INCREMENT,
  id_booking         INT(11),
  id_room            INT(11),
  arrival_date       DATE,
  date_departure     DATE,
  PRIMARY KEY (id_room_in_booking)
)
  ENGINE = InnoDB;

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

INSERT room_kind
(name, min_area)
VALUES
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100)),
  (FLOOR(1 + RAND() * 2), FLOOR(10 + RAND() * 100));

INSERT room
(id_hotel, id_room_kind, room_number, cost_day)
VALUES
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000)),
  (FLOOR(1 + RAND() * 97), FLOOR(1 + RAND() * 112), FLOOR(1 + RAND() * 1000), FLOOR(1 + RAND() * 10000));

INSERT client
(fio, phone)
VALUES (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
               CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
        '134632'),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   '568423567'),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   '557854325'),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   '843522557');

SELECT *
FROM room_kind;

SELECT *
FROM client;

SHOW TABLES ;
