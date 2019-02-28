/* Query per selezionare nome, cognome e tipo lavoro del lavoratore
e anche nome, cognome e tipo lavoro del capo.
Si fa riferimento nella stessa tabella che va quindi messa in join con un AS
 */

select em.lastName,em.firstName, em.jobTitle,  ch.lastName as Boss_lastName,ch.firstName as Boss_firstName, ch.jobTitle
	from employees em 
	inner join employees ch
    on em.reportsTo = ch.employeeNumber