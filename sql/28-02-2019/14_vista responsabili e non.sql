create view v_resp_e_non as

/* UNION (unione) tra due select (viste) */
select * from v_responsabili r
union 
select * from v_non_responsabili n

order by Boss_lastname,Boss_firstname