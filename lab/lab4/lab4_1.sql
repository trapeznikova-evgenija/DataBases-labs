SELECT
  vaccinated.date_vaccination,
  child.name,
  innoculation.disease
FROM vaccinated
  INNER JOIN innoculation ON vaccinated.id_innoculation = innoculation.id
  INNER JOIN child ON vaccinated.id_child = child.id;

/* 1 */
/* посмотреть прививки, которые делались Звездочкиной Марине Ивановне */
SELECT
  name,
  date_vaccination
FROM vaccinated
  LEFT JOIN child
    ON child.id = vaccinated.id_child
WHERE name = 'Звездочкина Марина Ивановна';

/* 2 */
SELECT
  name,
  date_vaccination
FROM child
  RIGHT JOIN vaccinated
    ON vaccinated.id_child = child.id
WHERE name = 'Звездочкина Марина Ивановна';


/* 3 */
/*таблица первого мальчика, которому сделали прививку*/
SELECT *
FROM vaccinated
LEFT JOIN child
  ON child.id = vaccinated.id_child
WHERE gender = 'Мужской' AND child.id = 1;

/* 4 */
/* показать все прививки от туберкулеза сделанные в 2018*/
SELECT disease, date_vaccination
FROM vaccinated
LEFT JOIN innoculation
  ON innoculation.id = vaccinated.id_innoculation
WHERE date_vaccination > '2018-00-00 00:00:00' AND disease = 'Туберкулез';

/* 5 */
/* посмотреть все прививки, на основе живой вакцины, в 2018 году против туберкулеза */
SELECT name_type, disease, date_vaccination
FROM vaccinated
LEFT JOIN innoculation
  ON vaccinated.id_innoculation = innoculation.id
LEFT JOIN type
  ON innoculation.id_type = type.id_type
WHERE name_type = 'Живая вакцина' AND date_vaccination > '2018-00-00 00:00:00' AND disease = 'Туберкулез';









