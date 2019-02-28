create view v_non_responsabili as 

/* Query con selezionati chi non ha sottoposti*/
select employeeNumber,lastName,firstName, jobTitle, 
0 as conteggio, "-" as eldip
from employees

where employeeNumber not in(
							select employeeNumber from v_responsabili
                            )