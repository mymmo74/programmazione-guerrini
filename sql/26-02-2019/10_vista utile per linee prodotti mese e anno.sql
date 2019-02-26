/* vista utile per linea per anno e mese */

create view v_utile_line_monthyear as

SELECT productLine, 
/* funzione per prelevare anno e mese dalla data Ordine */
year(orderDate) as anno, month(orderDate) as mese, 
sum(utile) as totutile FROM classicmodels.v_vendite_tot



group by anno , mese, productLine
order by productLine, anno, mese