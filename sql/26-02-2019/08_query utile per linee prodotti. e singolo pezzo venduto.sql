/* query per selezionare utile totali per linee prodotti, e utile per singolo prodotto
*/

SELECT productLine, sum(utile) as totUtile, sum(utile)/sum(quantityOrdered) as utileUn FROM classicmodels.v_vendite_tot

group by productLine
order by totUtile desc