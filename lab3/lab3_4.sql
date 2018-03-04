/* 1.INSERT */

INSERT INTO book
VALUES (6, 'Маленький принц', 'Антуант Де Сент Экзюпери', 2);

INSERT INTO book (name, author, amount)
VALUES ('Код Дурова', 'Николай Викторович Кононов', 2);

INSERT INTO shop (name, address)
SELECT (name, address)
FROM publishing_house;

/* 2.DELETE */

DELETE
FROM publishing_house;

DELETE
FROM book
WHERE name = 'Код Дурова';

TRUNCATE book;

/* 3.UPDATE */

UPDATE shop
SET address = 'Москва';

UPDATE shop
SET name = 'Радуга'
WHERE id = 3;

UPDATE shop
SET name = 'Радуга', address = 'Москва'
WHERE id = 3;

/* 4.SELECT */

SELECT address, name
FROM shop;

SELECT *
FROM book;

SELECT *
FROM book
WHERE name = 'Стив Джобс';
