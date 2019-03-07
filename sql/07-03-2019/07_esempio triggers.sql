CREATE DEFINER=`root`@`%` TRIGGER `talent_music_new`.`t_alunni_AFTER_UPDATE` AFTER UPDATE ON `t_alunni` FOR EACH ROW
BEGIN
insert into t_logalunni (tipo, id_alunno, datalog)
values
("modifica", OLD.id_alunno, now());
END