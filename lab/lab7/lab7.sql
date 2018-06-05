CREATE DATABASE IF NOT EXISTS university
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

SET CHARACTER_SET_SERVER = utf8;
USE university;
SHOW VARIABLES;

CREATE TABLE IF NOT EXISTS `group`
(
  id_group              INT(11) NOT NULL AUTO_INCREMENT,
  short_group_name      VARCHAR(255),
  id_elder              INT(11),
  short_profession_name VARCHAR(255),
  PRIMARY KEY (id_group)
)
  ENGINE = InnoDB;

ALTER TABLE `group`
  ADD FOREIGN KEY (id_elder) REFERENCES student (id_student);

CREATE TABLE IF NOT EXISTS student
(
  id_student    INT(11) AUTO_INCREMENT NOT NULL,
  surname       VARCHAR(255),
  id_group      INT(11),
  year_of_birth YEAR,
  PRIMARY KEY (id_student),
  FOREIGN KEY (id_group) REFERENCES `group` (id_group)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS object
(
  id_object    INT(11) AUTO_INCREMENT NOT NULL,
  object_name  VARCHAR(255),
  amount_hours INT(11),
  PRIMARY KEY (id_object)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS teacher
(
  id_teacher INT(11) AUTO_INCREMENT NOT NULL,
  surname    VARCHAR(255),
  position   VARCHAR(255),
  PRIMARY KEY (id_teacher)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS lesson
(
  id_lesson  INT(11) AUTO_INCREMENT NOT NULL,
  id_teacher INT(11),
  id_object  INT(11),
  id_group   INT(11),
  data       DATE,
  PRIMARY KEY (id_lesson),
  FOREIGN KEY (id_teacher) REFERENCES teacher (id_teacher),
  FOREIGN KEY (id_object) REFERENCES object (id_object),
  FOREIGN KEY (id_group) REFERENCES `group` (id_group)
)
  ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS assessment
(
  id_assessment INT(11) NOT NULL AUTO_INCREMENT,
  id_student    INT(11),
  id_lesson     INT(11),
  assesment     TINYINT,
  PRIMARY KEY (id_assessment),
  FOREIGN KEY (id_student) REFERENCES student (id_student),
  FOREIGN KEY (id_lesson) REFERENCES lesson (id_lesson)
)
  ENGINE = InnoDB;

/* FILL TABLES */

INSERT INTO `group` (short_group_name, id_elder, short_profession_name)
VALUES
  ('ПС-12', 2, 'ПС'),
  ('ПС-11', 5, 'ПС'),
  ('ПС-13', 6, 'ПС'),
  ('ПС-21', 7, 'ПС'),
  ('ПС-22', 9, 'ПС'),
  ('ПС-31', 14, 'ПС'),
  ('ПС-32', 1, 'ПС'),
  ('ИВТ-11', 19, 'ИВТ'),
  ('ИВТ-21', 13, 'ИВТ'),
  ('БИС-12', 10, 'БИС');

INSERT INTO student (surname, id_group, year_of_birth)
VALUES ('Кириллов', 8, '1993');

UPDATE student
SET surname = 'Дверев'
WHERE id_student = 8;

SELECT *
FROM `group`;

SELECT *
FROM student;

INSERT INTO object (object_name, amount_hours)
VALUES ('Матанализ', 200),
  ('Русский язык', 150),
  ('Филология', 55),
  ('Журналистика', 73),
  ('История', 78),
  ('Базы данных', 356),
  ('ООП', 243),
  ('Английский', 224);

SELECT *
FROM object;

INSERT INTO teacher (surname, position)
VALUES ('Максимов', 'преподаватель'),
  ('Петров', 'зав.кафедры'),
  ('Масленников', 'зав.кафедры'),
  ('Пандович', 'декан'),
  ('Ликеров', 'преподаватель'),
  ('Лучинин', 'преподаватель');

# 6 teacher 8 object 10 group

SELECT *
FROM lesson;
SELECT *
FROM student;

SELECT *
FROM assessment;

INSERT INTO lesson (id_teacher, id_object, id_group, data)
VALUES (2, 1, 7, '2018-05-28');

INSERT INTO assessment (id_student, id_lesson, assesment)
VALUES
  (8, 4, 3);

SELECT *
FROM student;

/* REQUESTS */

/* 1. Выдать оценки студентов по математике если они обучаются/обучались данному предмету.
      Оформить выдачу данных с использованием view. */

CREATE VIEW student_assesment_in_mathematics
  AS
    SELECT
      student.surname,
      assessment.assesment,
      object.object_name
    FROM assessment
      INNER JOIN student ON assessment.id_student = student.id_student
      INNER JOIN lesson ON assessment.id_lesson = lesson.id_lesson
      INNER JOIN object ON lesson.id_object = object.id_object
    WHERE object.object_name = 'Матанализ';

SELECT *
FROM student_assesment_in_mathematics;

/* 2. Дать информацию о должниках с указанием фамилии студента и названия предмета.
      Должниками считаются студенты, не имеющие оценки по предмету, который ведется в группе.
      Оформить в виде процедуры, на вход название группы. */
# может получиться так, что у студента нет долгов по какому-то предмету и он уже не должник

# DELIMITER //
#
# CREATE PROCEDURE get_debtors(IN group_name VARCHAR(255))
#   BEGIN
#     SELECT
#       student.surname,
#       object.object_name
#     FROM student
#       LEFT JOIN `group` ON student.id_group = `group`.id_group
#       LEFT JOIN lesson ON `group`.id_group = lesson.id_group
#       LEFT JOIN object ON lesson.id_object = object.id_object
#       LEFT JOIN assessment ON lesson.id_lesson = assessment.id_lesson
#     WHERE `group`.short_group_name = group_name AND student.id_student NOT IN (SELECT assessment.id_student
#                                                                                FROM assessment);
#   END;
# //

DELIMITER //

CREATE PROCEDURE get_debtors(IN group_name VARCHAR(255))
  BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS learner
      AS (SELECT
            lesson.id_lesson, student.id_student
          FROM lesson
            LEFT JOIN `group` ON lesson.id_group = `group`.id_group
            LEFT JOIN student ON `group`.id_group = student.id_group
            LEFT JOIN object ON lesson.id_object = object.id_object
            LEFT JOIN assessment ON lesson.id_lesson = assessment.id_lesson
          WHERE `group`.short_group_name = group_name);
    SELECT
      student.surname, object.object_name
    FROM learner
      LEFT JOIN assessment ON (learner.id_student = assessment.id_student AND assessment.id_lesson = learner.id_lesson)
      LEFT JOIN student ON learner.id_student = student.id_student
      LEFT JOIN lesson ON learner.id_lesson = lesson.id_lesson
      LEFT JOIN object ON lesson.id_object = object.id_object
    WHERE assessment.id_assessment IS NULL;

    DROP TEMPORARY TABLE learner;
  END;
//

DROP PROCEDURE get_debtors;
CALL get_debtors( 'ПС-21');

SELECT
  lesson.id_lesson, student.surname, student.id_student, object.object_name, object.id_object
FROM lesson
  LEFT JOIN `group` ON lesson.id_group = `group`.id_group
  LEFT JOIN student ON `group`.id_group = student.id_group
  LEFT JOIN object ON lesson.id_object = object.id_object
  LEFT JOIN assessment ON lesson.id_lesson = assessment.id_lesson
WHERE `group`.short_group_name = 'ПС-21';

/* 3. Дать среднюю оценку студентов по каждому предмету для тех предметов,
      по которым занимается не менее 10 студентов. */

CREATE INDEX IN_assessment
  ON assessment (assesment);

CREATE VIEW average_students_grade
  AS
    SELECT
      lesson.id_object,
      COUNT(assessment.id_student) AS amount_student,
      AVG(assessment.assesment)    AS average_grades
    FROM `group`
      INNER JOIN lesson ON `group`.id_group = lesson.id_group
      INNER JOIN student ON `group`.id_group = student.id_group
      INNER JOIN assessment ON student.id_student = assessment.id_student
      INNER JOIN object ON lesson.id_object = object.id_object
    GROUP BY lesson.id_object
    HAVING amount_student >= 1;

DROP VIEW average_students_grade;

SELECT
  object_name,
  average_grades,
  amount_student
FROM average_students_grade
  INNER JOIN object ON object.id_object = average_students_grade.id_object;

/* 4. Дать оценки студентов специальности ВМ по всем проводимым предметам с указанием группы, фамилии, предмета, даты.
      При отсутствии оценки заполнить значениями NULL поля оценки. */

CREATE INDEX IN_profession_name
  ON `group` (short_profession_name);

EXPLAIN SELECT
          student.surname,
          object.object_name,
          assessment.assesment,
          lesson.data,
          `group`.short_group_name
        FROM lesson
          LEFT JOIN `group` ON lesson.id_group = `group`.id_group
          LEFT JOIN student ON `group`.id_group = student.id_group
          LEFT JOIN assessment ON lesson.id_lesson = assessment.id_lesson
          LEFT JOIN object ON lesson.id_object = object.id_object
        WHERE `group`.short_profession_name = 'ИВТ';

/* 5. Всем студентам специальности ИВТ,
      получившим оценки меньшие 5 по предмету БД до 12.05, повысить эти оценки на 1 балл. */

SELECT *
FROM object;

SELECT
  student.surname,
  assessment.assesment
FROM assessment
  LEFT JOIN student ON assessment.id_student = student.id_student
  LEFT JOIN `group` ON student.id_group = `group`.id_group
  LEFT JOIN lesson ON `group`.id_group = lesson.id_group
  LEFT JOIN object ON lesson.id_object = object.id_object
WHERE `group`.short_profession_name = 'ИВТ' AND assessment.assesment < 5 AND object.object_name = 'Базы данных';

UPDATE assessment
  LEFT JOIN student ON assessment.id_student = student.id_student
  LEFT JOIN `group` ON student.id_group = `group`.id_group
  LEFT JOIN lesson ON `group`.id_group = lesson.id_group
  LEFT JOIN object ON lesson.id_object = object.id_object
SET assessment.assesment = assessment.assesment + 1
WHERE `group`.short_profession_name = 'ИВТ' AND assessment.assesment < 5 AND object.object_name = 'Базы данных';