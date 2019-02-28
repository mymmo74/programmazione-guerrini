/* Query usando funzione case

CASE
	WHEN cond THEN
    WHEN cond THEN
    ELSE cond THEN
END
    
    */
SELECT *,
		case
			when maxtot<20000 then 0
            when maxtot<40000 then 2000
            else 5000
		end as bonus

FROM classicmodels.v_bestEmp_month;