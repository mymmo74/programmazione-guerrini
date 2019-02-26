/* Query per selezionare cliente e data ordine
----customerName (società, cliente)
----orderDate (data ordine)
*/
select customerName, orderDate
	from orders o
    inner join customers cu
    on o.customerNumber=cu.customerNumber
    order by customerName