create view v_alunni_datigps as

SELECT al.id_alunno, com2.lat as lat, com2.lng as lng,
distanzaKM(com.lat, com.lng, com2.lat, com2.lng) as distanzasede
 FROM 
t_config c
inner join t_comuni_2018 com on c.sede=com.comune
,
t_alunni al inner join t_comuni_2018 com2
on al.comune=com2.comune