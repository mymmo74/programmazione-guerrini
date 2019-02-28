/* Metto un altro campo dinamico dove combino IF e CONCAT */
select em.lastName,em.firstName, em.jobTitle,  ch.lastName as Boss_lastName,ch.firstName as Boss_firstName, 
	if (ch.lastName is null, "CAPO",ch.jobTitle) as Boss_jobTitle,  
    concat("Riferisco a ", ch.lastName, " ", ch.firstName,  " ", ch.jobTitle) as riferisco,
    if (ch.lastName is null, "Il presidente non riferisce a nessuno", 
	from employees em 
	/* mettendo LEFT JOIN prendo anche il presidente, che non usciva nella precedente query */
    left join employees ch
    on em.reportsTo = ch.employeeNumber