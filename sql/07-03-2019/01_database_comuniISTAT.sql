SELECT * FROM 
	codici_istat

	left join view_all 
		on id_istat=istat
        order by istat