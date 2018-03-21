CREATE DATABASE IF NOT EXISTS medicine
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE medicine;

CREATE TABLE IF NOT EXISTS innoculation (
  id        INT(11)      NOT NULL AUTO_INCREMENT,
  disease   VARCHAR(255) NOT NULL,
  id_type   INT(11)      NOT NULL,
  id_method INT(11)      NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS type
(
  id_type   INT(11)      NOT NULL AUTO_INCREMENT,
  name_type VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_type)
)
  ENGINE = InnoDB;

INSERT INTO type (name_type)
VALUES ('Живая вакцина'),
  ('Инактивированная вакцина'),
  ('Токсоидная вакцина');

SELECT *
FROM type;

CREATE TABLE IF NOT EXISTS method
(
  id_method   INT(11)      NOT NULL AUTO_INCREMENT,
  name_method VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_method)
)
  ENGINE = InnoDB;

INSERT INTO method (name_method)
VALUES ('Внутрикожная'),
  ('Подкожная'),
  ('Внутримышечная');

SELECT *
FROM method;

INSERT INTO innoculation
(disease, id_type, id_method)
VALUES ('Туберкулез', 1, 3),
  ('Грипп', 2, 3),
  ('Дифтерия', 3, 1),
  ('Краснуха', 1, 1),
  ('Бешенство', 2, 1);

SELECT *
FROM innoculation;

CREATE TABLE IF NOT EXISTS vaccinated
(
  id               INT(11) NOT NULL AUTO_INCREMENT,
  id_innoculation  INT(11) NOT NULL,
  id_child         INT(11) NOT NULL,
  date_vaccination DATE,
  PRIMARY KEY (id)
)
  ENGINE = InnoDB;

INSERT INTO vaccinated
(id_innoculation, id_child, date_vaccination)
VALUES (1, 3, '2018-02-04 15:15:00'),
  (2, 2, '2017-12-12 13:20:00'),
  (1, 1, '2017-12-31 9:23:00'),
  (5, 3, '2017-11-02 8:00:00'),
  (4, 4, '2018-03-08 16:45:00');

ALTER TABLE vaccinated
  MODIFY date_vaccination TIMESTAMP;

SELECT *
FROM vaccinated;

CREATE TABLE IF NOT EXISTS child
(
  id            INT(11) NOT NULL AUTO_INCREMENT,
  name          VARCHAR(255),
  gender        VARCHAR(255),
  date_of_birth DATE,
  adress        VARCHAR(255),
  PRIMARY KEY (id)
)
  ENGINE InnoDB;

INSERT INTO child
(name, gender, date_of_birth, adress)
VALUES
  ('Петров Илья Андреевич', 'Мужской', '1999-09-01', 'Йошкар-Ола Заречная 3'),
  ('Васенев Василий Геннадьевич', 'Мужской', '2002-12-13', 'Йошкар-Ола Молодежная 25'),
  ('Звездочкина Марина Ивановна', 'Женский', '2000-03-09', 'Йошкар-Ола Труда 45а'),
  ('Лапушкина Александра Иосифовна', 'Женский', '2007-06-16', 'Йошкар-Ола Мира 34'),
  ('Зиновин Леонид Аркадьевич', 'Мужской', '2005-10-27', 'Йошкар-Ола Пролетарская 12');


SELECT *
FROM child;





