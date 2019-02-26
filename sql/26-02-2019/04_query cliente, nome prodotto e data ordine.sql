/* Query per selezionare cliente, prodotto e data ordine
servono 4 tabelle, per recuperare i dati, quindi si devono fare delle
INNER JOIN sulle tabelle
*/
select customerName, productName, orderDate
	from customers c
    inner join orders o
		on c.customerNumber=o.customerNumber
	inner join orderdetails od
		on o.orderNumber= od.orderNumber
	inner join products p
		on od.productCode=p.productCode
	order by customerName, productName