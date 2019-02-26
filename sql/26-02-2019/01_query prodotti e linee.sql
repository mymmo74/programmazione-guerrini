/* Query per trovare:
----productLine  (Linee di prodotto)
----productName (Nome prodotto)
----buyPrice (Prezzo di produzione)
----textDescription (Descrizione linea)
 */
SELECT pl.productLine, productName, buyPrice, textDescription
FROM   productlines pl inner join products p
	on  pl.productLine = p.productLine
order by pl.productLine, buyPrice desc,productName