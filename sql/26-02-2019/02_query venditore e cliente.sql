/* Query per trovare nome, cognome del venditore e nome e città del cliente
----lastName (cognome)
----firstName (nome)
----customerName (nome cliente, società)
----city (città cliente)
*/
select lastName,firstName, customerName, city
	from employees em 
	inner join customers cu
    on em.employeeNumber = cu.salesRepEmployeeNumber
    order by lastName,firstName