create view v_docenti_corsi_simple as v_docenti_corsi_simple


select nomecorso,cognome,nome from 
	t_docenti 
		join t_docenti_corsi 
			on t_docenti.id_docente = t_docenti_corsi.id_docente
		join t_corsi 
			on t_docenti_corsi.id_corso = t_corsi.id_corso
            order by nomecorso,cognome
            ;