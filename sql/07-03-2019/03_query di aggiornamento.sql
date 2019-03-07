/* Query di aggiornamento*/
update talent_music_new.t_alunni a
	INNER JOIN t_comuni_2018 c ON c.comune=a.comune
    
    set a.pv=c.provincia