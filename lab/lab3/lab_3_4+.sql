/* 1 */

SELECT *
FROM child
ORDER BY name ASC;

SELECT *
FROM child
ORDER BY adress DESC;

SELECT *
FROM child
ORDER BY name DESC, date_of_birth ASC;

SELECT
  name,
  date_of_birth
FROM child
ORDER BY name ASC;

/* 2 */

SELECT MIN(id_innoculation)
FROM vaccinated;

SELECT MAX(date_vaccination)
FROM vaccinated;

SELECT AVG(id_type)
FROM type;

SELECT SUM(id_type)
FROM innoculation;

/* 3 */

/* количество прививок по каждому типу вакцинации */
SELECT
  COUNT(id),
  id_type
FROM innoculation
GROUP BY id_type;

/* выбирает прививки, которые ставятся одним типом вакцинации больше одного раза */
SELECT
  COUNT(id),
  id_type
FROM innoculation
GROUP BY id_type
HAVING COUNT(id) > 1;



