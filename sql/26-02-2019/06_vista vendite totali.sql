/* Vista vendite totali,
mi aggiungo dei dati che mi possono essere utili per il calcolo di statistiche finanziarie
 */

create view v_vendite_tot as

SELECT v.salesRepEmployeeNumber, v.customerNumber, v.customerName, v.orderDate, v.productCode, p.productName,
	od.quantityOrdered, p.productLine,
	/*  mi calcolo il totale dei costi per prodotto
    e per vendita
    quindi l'utile (vendita-costi) */
    p.buyPrice*od.quantityOrdered as totBuy,
    od.priceEach*od.quantityOrdered as totSell,
    od.priceEach*od.quantityOrdered-p.buyPrice*od.quantityOrdered as utile
 FROM classicmodels.v_general_situation v
	inner join products p
    on p.productCode=v.productCode
    inner join orderdetails od
    on (v.ordernumber=od.ordernumber and v.orderlinenumber=od.orderlinenumber)
  
  
  order by p.productName  
