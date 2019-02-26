/* vista per miglior impiegato (singolo) del mese*/

create view v_bestEmp_month as

SELECT anno, mese, firstname, lastname, max(qty) as maxtot FROM classicmodels.v_salesRep_bestMonth

group by anno, mese
order by anno desc, mese desc