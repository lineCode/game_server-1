DROP TABLE IF EXISTS leagues;
CREATE TABLE IF NOT EXISTS leagues (
gid BIGINT UNSIGNED NOT NULL UNIQUE,
data MEDIUMBLOB NOT NULL
)
CHARACTER SET = utf8
ENGINE = InnoDB;

DELIMITER $$

DROP PROCEDURE IF EXISTS add_league$$
CREATE PROCEDURE add_league (IN param1 BIGINT UNSIGNED, IN param2 MEDIUMBLOB)
BEGIN
INSERT INTO leagues(gid, data)
VALUES(param1, param2);
END$$

DROP PROCEDURE IF EXISTS find_league$$
CREATE PROCEDURE find_league (IN param1 BIGINT UNSIGNED)
BEGIN
SELECT data
FROM leagues
WHERE gid = param1;
END$$

DROP PROCEDURE IF EXISTS delete_league$$
CREATE PROCEDURE delete_league (IN param1 BIGINT UNSIGNED)
BEGIN
DELETE FROM leagues
WHERE gid = param1;
END$$

DROP PROCEDURE IF EXISTS update_league$$
CREATE PROCEDURE update_league (IN param1 BIGINT UNSIGNED, IN param2 MEDIUMBLOB)
BEGIN
UPDATE leagues
SET data = param2
WHERE gid = param1;
END$$

DROP PROCEDURE IF EXISTS get_leagues$$
CREATE PROCEDURE get_leagues (IN param1 INT, IN param2 INT)
BEGIN
SELECT gid, data
FROM leagues
LIMIT param1, param2;
END$$

DELIMITER ;
