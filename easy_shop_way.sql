--
-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 7.1.13.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 02.09.2016 14:38:36
-- Версия сервера: 5.7.12-log
-- Версия клиента: 4.1
--


-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

-- 
-- Установка базы данных по умолчанию
--
USE easy_shop_way;

--
-- Описание для таблицы cupboard
--
DROP TABLE IF EXISTS cupboard;
CREATE TABLE cupboard (
  id INT(11) NOT NULL AUTO_INCREMENT,
  board_amount INT(11) NOT NULL,
  description_en VARCHAR(255) DEFAULT NULL,
  description_uk VARCHAR(255) DEFAULT NULL,
  active TINYINT(1) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы map
--
DROP TABLE IF EXISTS map;
CREATE TABLE map (
  id INT(11) NOT NULL AUTO_INCREMENT,
  weight INT(11) NOT NULL,
  height INT(11) NOT NULL,
  active TINYINT(1) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы product_type
--
DROP TABLE IF EXISTS product_type;
CREATE TABLE product_type (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name_en VARCHAR(50) NOT NULL,
  name_uk VARCHAR(50) NOT NULL,
  img VARCHAR(255) DEFAULT NULL,
  active TINYINT(1) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 4096
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы user
--
DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id INT(11) NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(32) NOT NULL,
  password VARCHAR(32) NOT NULL,
  date_of_birth DATE NOT NULL,
  active TINYINT(1) NOT NULL,
  role ENUM('admin','user') NOT NULL,
  language ENUM('en','uk') DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX email (email)
)
ENGINE = INNODB
AUTO_INCREMENT = 13
AVG_ROW_LENGTH = 1638
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы cupboard_placement
--
DROP TABLE IF EXISTS cupboard_placement;
CREATE TABLE cupboard_placement (
  id INT(11) NOT NULL AUTO_INCREMENT,
  map_id INT(11) NOT NULL,
  cupboard_id INT(11) NOT NULL,
  x_start INT(11) NOT NULL,
  y_start INT(11) NOT NULL,
  x_end INT(11) NOT NULL,
  y_end INT(11) NOT NULL,
  active TINYINT(1) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE INDEX cupboard_id (cupboard_id),
  CONSTRAINT FK_cupboard_placement_cupboard_id FOREIGN KEY (cupboard_id)
    REFERENCES cupboard(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_cupboard_placement_map_id FOREIGN KEY (map_id)
    REFERENCES map(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы product
--
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  id INT(11) NOT NULL AUTO_INCREMENT,
  product_type_id INT(11) NOT NULL,
  name_uk VARCHAR(50) NOT NULL,
  name_en VARCHAR(50) NOT NULL,
  active TINYINT(1) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_product_product_type_id FOREIGN KEY (product_type_id)
    REFERENCES product_type(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы product_list
--
DROP TABLE IF EXISTS product_list;
CREATE TABLE product_list (
  id INT(11) NOT NULL AUTO_INCREMENT,
  user_id INT(11) NOT NULL,
  product_id INT(11) NOT NULL,
  date DATE NOT NULL,
  time TIME NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_product_list_commodity_id FOREIGN KEY (product_id)
    REFERENCES product(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_product_list_user_id FOREIGN KEY (user_id)
    REFERENCES user(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

--
-- Описание для таблицы product_placement
--
DROP TABLE IF EXISTS product_placement;
CREATE TABLE product_placement (
  product_id INT(11) NOT NULL,
  cupboard_id INT(11) NOT NULL,
  x_start INT(11) NOT NULL,
  y_start INT(11) NOT NULL,
  x_end INT(11) NOT NULL,
  y_end INT(11) NOT NULL,
  board_number INT(11) NOT NULL,
  id INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id),
  CONSTRAINT FK_product_placement_cupboard_id FOREIGN KEY (cupboard_id)
    REFERENCES cupboard(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_product_placement_product_id FOREIGN KEY (product_id)
    REFERENCES product(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 8192
CHARACTER SET utf8
COLLATE utf8_general_ci
ROW_FORMAT = DYNAMIC;

-- 
-- Вывод данных для таблицы cupboard
--
INSERT INTO cupboard VALUES
(1, 3, 'different', 'різне', 1),
(2, 3, 'different', 'різне', 1),
(3, 5, 'all', 'все', 1);

-- 
-- Вывод данных для таблицы map
--
INSERT INTO map VALUES
(1, 50, 100, 1),
(2, 100, 100, 1),
(3, 100, 100, 0);

-- 
-- Вывод данных для таблицы product_type
--
INSERT INTO product_type VALUES
(1, 'seafood', 'морепродукти', NULL, 1),
(2, 'alcohol', 'алкоголь', NULL, 1),
(3, 'bakery', 'випічка', NULL, 1),
(4, 'dishes', 'їжа', NULL, 0);

-- 
-- Вывод данных для таблицы user
--
INSERT INTO user VALUES
(1, 'Michael', 'Armstrong', 'marmstrong0@woothemes.com', '1LGFuJEZlQ', '2007-08-19', 0, 'user', 'en'),
(2, 'Gregory', 'Reed', 'greed1@altervista.org', 'EDEVYwzz', '1996-08-07', 1, 'user', 'en'),
(3, 'Jacqueline', 'Ramirez', 'jramirez2@sohu.com', 'BlGTlu', '1988-03-01', 0, 'admin', 'en'),
(4, 'Marie', 'Perkins', 'mperkins3@sfgate.com', 'whXFsg3m', '1998-09-14', 0, 'admin', 'en'),
(5, 'Jacqueline', 'Ray', 'jray4@google.fr', 'cEvjdVxt5R1y', '1991-06-01', 1, 'admin', 'en'),
(6, 'Randy', 'Matthews', 'rmatthews5@sun.com', 'ruHBvMOE4h', '2002-04-30', 1, 'admin', 'en'),
(8, 'Adam', 'Wells', 'awells7@oaic.gov.au', 'znJXml5', '2004-02-15', 0, 'user', 'en'),
(9, 'Margaret', 'Tucker', 'mtucker8@ow.ly', 'TDTj4C7TUl', '1987-03-11', 1, 'user', 'en'),
(10, 'Amy', 'Hall', 'ahall9@taobao.com', 'ioR0tCczMv', '1989-09-22', 0, 'user', 'en'),
(11, 'Olya', 'narushynska', 'email@com.ua', 'password', '1992-11-11', 1, 'user', 'en');

-- 
-- Вывод данных для таблицы cupboard_placement
--
INSERT INTO cupboard_placement VALUES
(1, 1, 1, 1, 20, 10, 1, 1),
(4, 1, 2, 1, 1, 2, 1, 1);

-- 
-- Вывод данных для таблицы product
--
INSERT INTO product VALUES
(1, 1, 'лобстер', 'lobster', 1),
(2, 2, 'червоне вино', 'red wine', 1),
(3, 3, 'хліб', 'bread', 1);

-- 
-- Вывод данных для таблицы product_list
--
INSERT INTO product_list VALUES
(2, 1, 1, '2015-10-11', '23:36:0'),
(3, 2, 2, '2016-02-11', '12:43:0');

-- 
-- Вывод данных для таблицы product_placement
--
INSERT INTO product_placement VALUES
(1, 1, 1, 1, 2, 2, 10, 3),
(2, 1, 3, 3, 4, 4, 3, 4);

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;