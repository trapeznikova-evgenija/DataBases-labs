CREATE DATABASE IF NOT EXISTS preparation
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE preparation;

SET CHARACTER_SET_SERVER = utf8;
SHOW VARIABLES LIKE 'character_set%';

/* CREATE TABLES */
CREATE TABLE IF NOT EXISTS company
(
  id_company      INT(11) NOT NULL AUTO_INCREMENT,
  name            VARCHAR(255),
  year_foundation YEAR,
  PRIMARY KEY (id_company)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS dealer
(
  id_dealer INT(11) NOT NULL AUTO_INCREMENT,
  surname   VARCHAR(255),
  phone     VARCHAR(255),
  PRIMARY KEY (id_dealer)
)
  ENGINE = InnoDB;

ALTER TABLE dealer
  ADD id_company INT(11);

SHOW TABLES;

CREATE TABLE IF NOT EXISTS medicament
(
  id_medicament      INT(11) NOT NULL AUTO_INCREMENT,
  name               VARCHAR(255),
  duration_treatment INT(11),
  PRIMARY KEY (id_medicament)
)
  ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS production_medicament
(
  id_consignment  INT(11) NOT NULL AUTO_INCREMENT,
  id_company      INT(11),
  id_medicament   INT(11),
  cost            INT(11),
  quality_control TINYINT,
  PRIMARY KEY (id_consignment)
)
  ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS pharmacy
(
  id_pharmacy INT(11) NOT NULL AUTO_INCREMENT,
  name        VARCHAR(255),
  adress      VARCHAR(255),
  PRIMARY KEY (id_pharmacy)
);

CREATE TABLE IF NOT EXISTS order_medicine
(
  id_order       INT(11) NOT NULL AUTO_INCREMENT,
  id_consignment INT(11),
  id_dealer      INT(11),
  id_pharmacy    INT(11),
  date_order     DATE,
  amount         INT(11),
  PRIMARY KEY (id_order)
);

/*FILL TABLES*/

INSERT company
(name, year_foundation)
VALUES
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38)),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38)),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38)),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38)),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38)),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38)),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38)),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38)),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38)),
  (CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999)),
   FLOOR(1980 + RAND() * 38));

SELECT *
FROM company;

DROP TABLE production_medicament;

SHOW TABLES;

UPDATE company
SET name = CONCAT(CHAR(FLOOR(65 + RAND() * 26)), CHAR(FLOOR(65 + RAND() * 26)), "-", FLOOR(10 + RAND() * 999));

INSERT dealer
(surname, phone, id_company)
VALUES
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(FLOOR(1000 + RAND() * 100000)), FLOOR(1 + RAND() * 99));

UPDATE dealer
SET phone = CONCAT(FLOOR(1000 + RAND() * 100000));

UPDATE dealer
SET id_company = FLOOR(1 + RAND() * 99);

SELECT *
FROM dealer;

INSERT medicament
(name, duration_treatment)
VALUES
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))), FLOOR(1 + RAND() * 356)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))), FLOOR(1 + RAND() * 356));

SELECT *
FROM medicament;

INSERT pharmacy
(name, adress)
VALUES
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "вах", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "вах", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)))),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "вах", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))),
   CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "вах", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11))));

SELECT *
FROM pharmacy;

INSERT production_medicament
(id_company, id_medicament, cost, quality_control)
VALUES
  (FLOOR(1 + RAND() * 99), FLOOR(1 + RAND() * 101), FLOOR(20 + RAND() * 300), FLOOR(1 + RAND() * 9)),
  (FLOOR(1 + RAND() * 99), FLOOR(1 + RAND() * 101), FLOOR(20 + RAND() * 200), FLOOR(1 + RAND() * 9)),
  (FLOOR(1 + RAND() * 99), FLOOR(1 + RAND() * 101), FLOOR(20 + RAND() * 100), FLOOR(1 + RAND() * 9));

SELECT *
FROM production_medicament;

INSERT order_medicine
(id_consignment, id_dealer, id_pharmacy, date_order, amount)
VALUES
  (FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 102),
   CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31)),
   FLOOR(1 + RAND() * 100)),
  (FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 102),
   CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31)),
   FLOOR(1 + RAND() * 100)),
  (FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 102),
   CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31)),
   FLOOR(1 + RAND() * 100)),
  (FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 102),
   CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31)),
   FLOOR(1 + RAND() * 100)),
  (FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 102),
   CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31)),
   FLOOR(1 + RAND() * 100)),
  (FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 102),
   CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31)),
   FLOOR(1 + RAND() * 100)),
  (FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 101), FLOOR(1 + RAND() * 102),
   CONCAT(FLOOR(2005 + RAND() * 13), "-", FLOOR(1 + RAND() * 11), "-", FLOOR(1 + RAND() * 31)),
   FLOOR(1 + RAND() * 100));

SELECT *
FROM order_medicine;

SELECT *
FROM order_medicine, company, dealer
WHERE order_medicine.id_order = company.id_company = dealer.id_dealer;

SELECT *
FROM order_medicine;

ALTER TABLE dealer
  MODIFY COLUMN id_company INT(11),
  ADD CONSTRAINT id_company
FOREIGN KEY (id_company)
REFERENCES company (id_company);

ALTER TABLE production_medicament
  MODIFY COLUMN id_medicament INT(11),
  ADD CONSTRAINT FOREIGN KEY (id_medicament)
REFERENCES medicament (id_medicament);

ALTER TABLE order_medicine
  MODIFY COLUMN id_consignment INT(11),
  ADD CONSTRAINT FOREIGN KEY (id_consignment)
REFERENCES production_medicament (id_consignment);

ALTER TABLE order_medicine
  MODIFY COLUMN id_dealer INT(11),
  ADD CONSTRAINT FOREIGN KEY (id_dealer)
REFERENCES dealer (id_dealer);

ALTER TABLE order_medicine
  MODIFY COLUMN id_pharmacy INT(11),
  ADD CONSTRAINT FOREIGN KEY (id_pharmacy)
REFERENCES pharmacy (id_pharmacy);

SELECT *
FROM order_medicine;

SELECT *
FROM medicament;

UPDATE medicament
SET name = 'Кордерон'
WHERE id_medicament = 5;

SELECT *
FROM company;

UPDATE production_medicament
SET id_company = 56, id_medicament = 5
WHERE id_consignment = 22;

UPDATE order_medicine
SET id_consignment = 22
WHERE id_order = 78;

SELECT *
FROM order_medicine;

UPDATE company
SET name = 'Аргус'
WHERE id_company = 56;

SELECT
  date_order,
  amount,
  medicament.name,
  pharmacy.name,
  company.name
FROM order_medicine
  LEFT JOIN production_medicament
    ON production_medicament.id_consignment = order_medicine.id_consignment
  LEFT JOIN pharmacy
    ON pharmacy.id_pharmacy = order_medicine.id_pharmacy
  LEFT JOIN company
    ON company.id_company = production_medicament.id_company
  LEFT JOIN medicament
    ON medicament.id_medicament = production_medicament.id_medicament
WHERE company.name = 'Аргус' AND medicament.name = 'Кордерон';
