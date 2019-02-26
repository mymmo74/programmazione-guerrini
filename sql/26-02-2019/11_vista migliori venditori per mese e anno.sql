/* Vista per la selezione del miglior
venditore del mese (nell'anno di riferimento
*/
create view v_salesRep_bestMonth as

SELECT year(v.orderDate) as anno, month(v.orderDate) as mese,lastname, firstname, sum(utile) as qty
 FROM classicmodels.v_vendite_tot v
 inner join employees e
 on v.salesRepEmployeeNumber=e.employeeNumber

group by e.employeeNumber ,anno, mese
order by anno desc, mese desc,qty desc