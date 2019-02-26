/* query per prendere l'utile totale per linee di prodotto
----productLine (Linee prodotto)
----sum(utile) as totUtile  somma tutti gli utili e mi rinomina in totUtile
*/
SELECT productLine, sum(utile) as totUtile FROM classicmodels.v_vendite_tot

group by productLine
order by totUtile desc