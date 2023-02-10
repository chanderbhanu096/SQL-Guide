--Joins intro
select orders.*,accounts.*
from orders
join accounts
on orders.account_id = accounts.id;

--'here "orders.account_id = accounts.id" here switching them across "=" doesnt affect. whether whether we write from' **order along with oders or accounts with order it doesn;t matter because there are only two tables here.**

--example 2
select orders.standard_qty,orders.gloss_qty,orders.poster_qty,accounts.website,accounts.primary_poc
from orders
join accounts
on orders.account_id= accounts.id;

--Try pulling all the data from the accounts table, and all the data from the orders table.
select accounts.*,orders.*
from accounts
join orders
on orders.account_id= accounts.id

--Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.
select orders.standard_qty,orders.gloss_qty,orders.poster_qty,accounts.website,accounts.primary_poc
from orders
join accounts
on orders.account_id= accounts.id

'Keys'
    --Primary Key
      --A primary key is a unique column in a particular table. This is the first column in each of our tables. Here, those columns are all called id, but that doesnt necessarily have to be the name. It is common that the primary key is the first column in our tables in most databases.

    --Foreign Key
      --A foreign key is a column in one table that is a primary key in a different table. We can see in the Parch & Posey ERD

'ALIAS'
      SELECT o.*, a.*
      FROM orders o
      JOIN accounts a
      ON o.account_id = a.id
        "OR"      "BOTH WAYS ARE RIGHT"
      SELECT o.*, a.*
      FROM orders as o
      JOIN accounts as a
      ON o.account_id = a.id

--QUERY Provide a table for all web_events associated with the account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.
SELECT a.primary_poc,w.occurred_at,w.channel,a.name
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
WHERE a.name = 'Walmart';

--Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to the account name.
SELECT r.name region_name,s.name sales_name,a.name account_name
FROM sales_reps s
JOIN region r
ON r.id = s.region_id
join accounts a
on s.id = a.sales_rep_id
order by a.name;

--QUERY Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.
SELECT r.name region,a.name account_name,(o.total_amt_usd/(o.total+.01)) unit_price
FROM sales_reps s
JOIN region r
ON r.id = s.region_id
join accounts a
on s.id = a.sales_rep_id
join orders o
on a.id = o.account_id;

--Left JOIN as well as RIGHT JOIN
--each of these new JOIN statements pulls all the same rows as an INNER JOIN, which you saw by just using JOIN, but they also potentially pull some additional rows.

--If there is not matching information in the JOINed table, then you will have columns with empty cells. These empty cells introduce a new data type called NULL. You will learn about NULLs in detail in the next lesson, but for now you have a quick introduction as you can consider any cell without data as NULL.

--QUERY SELECT
--left join example
a.id, a.name, o.total
FROM orders o
LEFT JOIN accounts a
ON o.account_id = a.id
-- this will return all the columns as well rows from the table orders o along with the intersection data with table accounts a

--QUERY 2
--right join example
SELECT a.id, a.name, o.total
FROM orders o
RIGHT JOIN accounts a
ON o.account_id = a.id
-- reverse to the left join

same thing but different syntax
