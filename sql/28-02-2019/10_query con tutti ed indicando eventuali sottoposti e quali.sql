/* Query con selezionati i capi e quanti e quali (GROUP_CONCAT) sottoposti hanno*/
select ch.employeeNumber,ch.lastName as Boss_lastName,ch.firstName as Boss_firstName, ch.jobTitle,
	count(em.employeeNumber) as conteggio,
	group_concat(em.lastName) as eldip
	/* mettendo RIGHT JOIN metto tutti*/
    from employees em right join employees ch on em.reportsTo = ch.employeeNumber
group by ch.employeeNumber