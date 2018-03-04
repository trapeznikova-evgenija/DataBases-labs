CREATE DATABASE IF NOT EXISTS medicine
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE medicine;

CREATE TABLE IF NOT EXISTS innoculation (
  id INT(11) NOT NULL AUTO_INCREMENT,
  type
  method
  disease VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE=InnoDB;

SELECT *
FROM innoculation;

INSERT INTO innoculation(type, method, disease)
VALUES ()
