/* Query con selezionati i capi e quanti sottoposti hanno*/
select ch.employeeNumber,ch.lastName as Boss_lastName,ch.firstName as Boss_firstName, ch.jobTitle,
	count(em.employeeNumber) as conteggio
	from employees em 
	left join employees ch
    on em.reportsTo = ch.employeeNumber
group by ch.employeeNumber