--Creare un database con Postgresql chiamato "pizzeria_da_luigi" utilizzando PgAdmin (o un client a tua scelta)

CREATE DATABASE pizzeria_da_luigi;

-- All'interno del database crea una una tabella "ordine" con i seguenti campi 
    -- id --> numerico non nullo
    -- nome_pizza --> text 
    -- nome_cliente --> text 
    -- data_ordine --> datetime
    -- totale_ordine --> double 

CREATE TABLE orders(
    order_id int NOT NULL,
    pizza_name varchar(20),
    client_name varchar(20),
    order_date timestamp,
    order_total decimal(99,2)
);



--Popolare la tabella con almeno 10 righe (ripetere almeno una volta il nome della pizza e/o il nome cliente)
    --es: 0, "Margherita", "Davide", 14/01/2022, 5.5
      --  1, "Peperoni", "Davide", 14/01/2022, 7
       -- 2, "Margherita", "Marco", 14/01/2022, 5.5
        -- 3, "4 Formaggi", "Carla", 15/01/2022, 8


insert into orders values (0, "Margherita", "Davide", 14/01/2022, 5.5),( 1, "Peperoni", "Davide", 14/01/2022 20:05, 7),
(2, "Margherita", "Marco", 14/01/2022 21:00, 5.5),
(3, "4 Formaggi", "Carla", 15/01/2022 12:45, 8),
(4,"Marinara","Mirko",17/01/2022 21:00,5),
(5, "Margherita", "Damiano", 14/01/2022 21:00, 5.5),
(6,"Marinara","Daniele",17/01/2022 15:30,5),
(7, "4 Formaggi", "Carla", 15/01/2022 17:10, 8);



/*
crivere una query che selezioni: 

4. tutte le colonne dalla tabella "ordine" senza ordinamento o selezioni */

select * from orders;

/*5. solamente le colonne "id", "totale_ordine", "data_ordine"*/

select 'id','orders_total','order_date' from orders;

/*6. Tutti i clienti presenti nella tabella ma senza ripetizioni dei record*/

select DISTINCT client_name from orders;

/*7. Le pizze ordinate da uno specifico cliente (es Davide)*/

select * from orders where client_name = 'Davide';

/*8. Le pizze ordinate in una specifica data*/

select pizza_name from orders where date='17/08/2022 18:00';

--9. Le righe che hanno come nome della pizza "margherita" e come cliente "Davide"
select * from orders where pizza_nome='Margherita' AND client_name='Davide';


--10. Contare quante righe sono presenti nella tabella
select count(*) from orders;

--11. Gli ordini che sono di uno specifico giorno
select * from orders where order_date ='17/08/2022';

--12. Gli ordini che hanno almeno 3 nome diversi di pizza 
  --  hint: usare clausola "IN"
select * from orders where nome_pizza IN ('Margherita','Marinara','Peperoni');


--13. /*Il totale dei prezzi 
  --  hint: usare la SUM*/ 

    select  SUM(orders_total) AS 'totale ordine' from orders; 

--14. Il totale dei prezzi per una singola giornata
  select  SUM(orders_total) AS 'totale ordine' from orders where order_date ='17/08/2022';

--15. La media dell'incasso giornalieria 
select AVG(orders_total) AS 'totale ordine' from orders where order_date ='17/08/2022';


--16. Il massimo ordine di ogni cliente 
select client_name,MAX(order_total) from orders  group by client_name;

--17. Tutti i giorni in cui c'è stato almeno un ordine (solo data no ora e minuti)
select DISTINCT date(order_date) from orders;

--18. Tutti gli ordini a più di 6 euro e meno di 8
select * from orders where order_total between 6.1 and 7.9;
--19. Solamente i primi 5 ordini in ordine temporale (dal più recente al più vecchio)
select * from orders ORDER BY data_ordine DESC LIMIT 5 ; 




