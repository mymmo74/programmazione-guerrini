/* Creo una vista in cui mi metto un po' tutti gli indici
per andare sulle varie tabelle, 
inoltre mi salvo un po' di altri dati tipo nome del cliente, data ordine, ecc
*/

create view v_general_situation as
 
select c.salesRepEmployeeNumber,c.customerNumber, c.customerName, o.orderNumber, o.orderDate, od.orderLineNumber, od.productCode, p.productName
	from customers c
    inner join orders o
		on c.customerNumber=o.customerNumber
	inner join orderdetails od
		on o.orderNumber= od.orderNumber
	inner join products p
		on od.productCode=p.productCode
	