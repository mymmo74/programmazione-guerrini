/* Query per selezionare nome, cognome e tipo lavoro del lavoratore
e anche nome, cognome e tipo lavoro del capo. e i tutta la gerarchia dei capi
Si fa riferimento nella stessa tabella che va quindi messa in join con un AS
 */

select em.lastName,em.firstName, em.jobTitle,  
	ch.lastName as Boss_lastName,ch.firstName as Boss_firstName, ch.jobTitle,
    d.lastName as Boss2_lastName,d.firstName as Boss2_firstName, d.jobTitle,
    g.lastName as Boss3_lastName,g.firstName as Boss3_firstName, g.jobTitle
	from employees em 
	left join employees ch
    on em.reportsTo = ch.employeeNumber
    left join employees d
    on ch.reportsTo = d.employeeNumber
    left join employees g
    on d.reportsTo = g.employeeNumber