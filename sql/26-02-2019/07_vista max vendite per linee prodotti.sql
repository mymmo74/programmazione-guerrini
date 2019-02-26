/* vista per selezionare la miglior linea
per pezzi venduti*/
create view v_BestLineQty as

SELECT productLine, sum(quantityOrdered) as qty
 FROM classicmodels.v_vendite_tot
 
group by productLine
order by qty desc