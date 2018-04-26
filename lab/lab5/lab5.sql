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

INSERT medicament
(name, duration_treatment)
VALUES
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))), FLOOR(1 + RAND() * 356)),
  (CONCAT(CHAR(FLOOR(109 + RAND() * 11)), "и", CHAR(FLOOR(109 + RAND() * 11)), CHAR(FLOOR(109 + RAND() * 11)),
          CHAR(FLOOR(109 + RAND() * 11))), FLOOR(1 + RAND() * 356));

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

INSERT production_medicament
(id_company, id_medicament, cost, quality_control)
VALUES
  (FLOOR(1 + RAND() * 99), FLOOR(1 + RAND() * 101), FLOOR(20 + RAND() * 300), FLOOR(1 + RAND() * 9)),
  (FLOOR(1 + RAND() * 99), FLOOR(1 + RAND() * 101), FLOOR(20 + RAND() * 200), FLOOR(1 + RAND() * 9)),
  (FLOOR(1 + RAND() * 99), FLOOR(1 + RAND() * 101), FLOOR(20 + RAND() * 100), FLOOR(1 + RAND() * 9));

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

UPDATE medicament
SET name = 'Кордерон'
WHERE id_medicament = 5;

UPDATE production_medicament
SET id_company = 56, id_medicament = 5
WHERE id_consignment = 22;

UPDATE production_medicament
SET id_company = 69
WHERE id_consignment = 3;

/*REQUESTS*/

/*2.Выдать информацию по всем заказам лекарства “Кордерон” компании “Аргус” с указанием названий
  аптек, дат, объема заказов.*/
EXPLAIN SELECT
          date_order,
          amount,
          medicament.name AS medicament_name,
          pharmacy.name   AS pharmacy_name,
          company.name    AS company_name
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

CREATE INDEX IN_order_medicine_id_consignment ON order_medicine (id_consignment);
CREATE INDEX IN_production_medicament_id_medicament ON production_medicament (id_medicament);
CREATE INDEX IN_production_medicament_id_company ON production_medicament (id_company);

/*3.Дать список лекарств компании “Фарма”, на которые не были сделаны заказы до 1.05.12.
*/
EXPLAIN SELECT DISTINCT
          medicament.name AS medicament_name,
          medicament.id_medicament
        FROM production_medicament
          LEFT JOIN order_medicine ON order_medicine.id_consignment = production_medicament.id_consignment
          LEFT JOIN medicament ON medicament.id_medicament = production_medicament.id_medicament
          LEFT JOIN company ON production_medicament.id_company = company.id_company
        WHERE company.name = 'Фарма' AND order_medicine.id_order NOT IN
                                         (
                                           SELECT order_medicine.id_order
                                           FROM order_medicine
                                             LEFT JOIN production_medicament
                                               ON production_medicament.id_consignment = order_medicine.id_consignment
                                             LEFT JOIN medicament
                                               ON production_medicament.id_medicament = medicament.id_medicament
                                           WHERE (date_order < '2012-05-01')
                                         );

CREATE INDEX IN_company_name ON company (name);

/*4.Дать минимальный и максимальный баллы лекарств каждой фирмы, которая производит не менее 100 препаратов,
с указанием названий фирмы и количества лекарства
*/
EXPLAIN SELECT
          company.name AS company_name,
          MIN(production_medicament.quality_control),
          MAX(production_medicament.quality_control),
          COUNT(production_medicament.id_medicament)
        FROM production_medicament
          LEFT JOIN company ON production_medicament.id_company = company.id_company
          LEFT JOIN medicament ON production_medicament.id_medicament = medicament.id_medicament
        GROUP BY company.id_company, company.name
        HAVING COUNT(production_medicament.id_medicament) > 3;

CREATE INDEX IN_production_medicament_id_company_id_medicament ON production_medicament (id_company, id_medicament);

/*5.Дать списки сделавших заказы аптек по всем дилерам компании “Гедеон Рихтер”.
Если у дилера нет заказов, в названии аптеки проставить NULL.*/
EXPLAIN SELECT
          dealer.surname AS surname_dealer,
          pharmacy.name  AS pharmacy_name
        FROM dealer
          LEFT JOIN order_medicine ON order_medicine.id_dealer = dealer.id_dealer
          LEFT JOIN pharmacy ON pharmacy.id_pharmacy = order_medicine.id_pharmacy
          LEFT JOIN company ON dealer.id_company = company.id_company
        WHERE company.name = 'Гедеон Рихтер';

CREATE INDEX IN_order_medicine_id_dealer ON order_medicine (id_dealer);
CREATE INDEX IN_dealer_id_company ON dealer (id_company);

/*6.Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, а длительность лечения не более 7 дней.
*/
UPDATE production_medicament
  LEFT JOIN medicament ON production_medicament.id_medicament = medicament.id_medicament
SET production_medicament.cost = production_medicament.cost * 0.8
WHERE production_medicament.cost > 3000 AND medicament.duration_treatment <= 7;