CREATE DATABASE IF NOT EXISTS lab3
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE  utf8_general_ci;

USE lab3;

CREATE TABLE IF NOT EXISTS publishing_house (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE=InnoDB;

SELECT *
FROM publishing_house;

INSERT INTO publishing_house (name, address)
VALUES ('МаннИвановФербер', 'Москва'),
  ('Питер', 'Санкт-Петербург'),
  ('Просвещение', 'Москва'),
  ('Альянс', 'Воронеж'),
  ('Альт', 'Казань'),
  ('Речь', 'Москва');

CREATE TABLE IF NOT EXISTS book_delivery (
  id INT(11) NOT NULL AUTO_INCREMENT,
  id_shop INT(11) NOT NULL,
  id_publishing_house INT(11) NOT NULL,
  id_book INT(11) NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE=InnoDB;

SELECT *
FROM book_delivery;

INSERT INTO book_delivery (id_shop, id_publishing_house, id_book)
VALUES (1, 2, 3),
  (2, 4, 4),
  (5, 3, 2),
  (3, 2, 1),
  (3, 2, 4);

CREATE TABLE IF NOT EXISTS shop (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE=InnoDB;

SELECT *
FROM shop;

INSERT INTO shop (name, address)
VALUES ('Мир Книги', 'Йошкар-Ола'),
  ('Школьник', 'Чебоксары'),
  ('Дом Книги', 'Йошкар-Ола'),
  ('КанцТовары', 'Казань'),
  ('Розовый Слоник', 'Москва');

CREATE TABLE IF NOT EXISTS book (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  amount INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE=InnoDB;

SELECT *
FROM book;

INSERT INTO book (name, author, amount)
VALUES ('Код Дурова', 'Николай Викторович Кононов', 2),
  ('Стив Джобс', 'Уолтер Айзексон', 4),
  ('Как люди думают?', 'Дмитрий Чернышев', 13),
  ('Кради как художник', 'Клеон Остин', 82),
  ('Великий Гэтсби', 'Фрэнсис Скотт Фицджеральд', 34);
