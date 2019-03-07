USE `talent_music_new`;
DROP function IF EXISTS `prodotto`;

/* Delimitatore fittizio chiamato nel nostro caso $$ */
/* Usa $$ come delimitatore, cioè come se fosse il ; */
DELIMITER $$
USE `talent_music_new`$$
CREATE FUNCTION prodotto (x1 integer, x2 integer) returns int(11)


BEGIN
	declare ris integer;
    set ris =x1*x2;
	RETURN ris;
END$$

DELIMITER ;

