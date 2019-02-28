/* Query usando funzione case

CASE
	WHEN cond THEN
    WHEN cond THEN
    ELSE cond THEN
END
    
    */
SELECT v_bestEmp_month.*,
		case
			when maxtot<soglia1 then bonus1
            when maxtot<soglia2 then bonus2
            else bonusover
		end as bonus

/* mettendo una seconda tabella (di una riga) config*/
FROM classicmodels.v_bestEmp_month,config