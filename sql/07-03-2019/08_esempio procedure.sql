CREATE DEFINER=`root`@`%` PROCEDURE `alunnivicini`(param_distanza integer)
BEGIN

SELECT al1.cognome, al1.nome, al2.cognome, al2.nome, distanzaKM(al1.lat, al1.lng, al2.lat, al2.lng) as vicinikm FROM v_alunni_datigps al1, v_alunni_datigps al2
where al1.id_alunno <al2.id_alunno
group by al1.id_alunno, al2.id_alunno
having vicinikm < param_distanza
order by al1.id_alunno;

END