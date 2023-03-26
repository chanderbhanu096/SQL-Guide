--NULL
    -- NULLs are different than a zero - they are cells where data does not exist.
    --When identifying NULLs in a WHERE clause, we write IS NULL or IS NOT NULL. We don't use =, 
    -- because NULL isn't considered a value in SQL. Rather, it is a property of the data.
  SELECT *
  FROM accounts
  WHERE primary_poc IS NULL
  -- NULLS ARE NOT EQUAL TO ANYTHING, INCLUDING THEMSELVES
  "AND"-- FOR NOT NULL
  SELECT *
  FROM accounts
  WHERE primary_poc IS NOT NULL

"COUNT" use example   
   
    -- COUNT - COUNTS THE NUMBER OF ROWS IN A TABLE
      SELECT COUNT(*)
      FROM accounts
    -- count return the count of rows with non-null values in the specified column.
      SELECT COUNT(primary_poc) AS account_primary_poc_count
      FROM accounts 

    -- COUNTING creating a new column with the count
      SELECT COUNT(primary_poc) AS orders_count
      FROM accounts
    -- COUNTING DISTINCT VALUES
      SELECT COUNT(DISTINCT primary_poc)
      FROM accounts

    -- GROUPS THE DATA BY A SPECIFIC COLUMN and COUNTS THE NUMBER OF ROWS IN EACH GROUP
      SELECT COUNT(primary_poc) AS orders_count,primary_poc
      FROM accounts
      GROUP BY primary_poc

"Sum" use example
    -- can only be used with numeric columns
    -- can only be applied to columns not like count which can be applied with * or a column name
    -- SUM - ADDS UP THE VALUES IN A COLUMN
      SELECT SUM(amount)
      FROM orders
    -- SUMMING A SPECIFIC COLUMN
      SELECT SUM(amount) AS total_amount
      FROM orders
    -- SUMMING A SPECIFIC COLUMN AND GROUPING THE DATA BY ANOTHER COLUMN
      SELECT SUM(amount) AS total_amount,primary_poc
      FROM orders
      GROUP BY primary_poc
  
  -- QUERIES ON SUM USE 
  --Find the total amount of poster_qty paper ordered in the orders table.
    SELECT SUM(poster_qty) as total_amount_posterqty
    FROM ORDERS

  --Find the total amount of standard_qty paper ordered in the orders table.
    SELECT SUM(standard_qty) as total_amount_standard_qty
    FROM ORDERS

  --Find the total dollar amount of sales using the total_amt_usd in the orders table.
    SELECT SUM(total_amt_usd) as total_sales_total_amt_usd
    FROM ORDERS
  
  /* Find the total amount for each individual order that was spent on standard and gloss paper in the orders table.
     This should give a dollar amount for each order in the table.*/
     --this show the standard_amt_usd , gloss_amt_usd, and their sum for each order
    SELECT standard_amt_usd, gloss_amt_usd, standard_amt_usd + gloss_amt_usd AS total_standard_gloss
    FROM orders;

  /* Though the price/standard_qty paper varies from one order to the next. I would like this 
  ratio across all of the sales made in the orders table. */
    SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS standard_price_per_unit 
    FROM orders;


"MIN & Max" use cases 
  --Use in the same way AS sum and count i,e on the column name
  example 1
    SELECT MIN(standard_qty) AS standard_min,
    MIN(gloss_qty) AS gloss_min,
    MIN(poster_qty) AS poster_min,
    MAX(standard_qty) AS standard_max,
    MAX(gloss_qty) AS gloss_max,
    MAX(poster_qty) AS poster_max
    FROM   orders
  
"AVG" USE CASE example
  -- when finding the average null values are ignored in numerator and denominator 
  -- to find the average with null values use the sum and count functions. sum divided by count.
  example 1
    SELECT AVG(standard_qty) AS standard_avg,
    AVG(gloss_qty) AS gloss_avg,
    AVG(poster_qty) AS poster_avg
    FROM orders
"Queries on MIN, MAX, & AVERAGE"
  -- When was the earliest order ever placed? You only need to return the date.
    select min(occurred_at) as earliest_orderdate 
    from orders;

  -- Try performing the same query as in question 1 without using an aggregation function.
    SELECT occurred_at 
    FROM orders 
    ORDER BY occurred_at
    LIMIT 1;

  --When did the most recent (latest) web_event occur?
    select max(occurred_at) as earliest_orderdate 
    from web_events;
  
  --Try to perform the result of the previous query without using an aggregation function.
    SELECT occurred_at
    FROM web_events
    ORDER BY occurred_at DESC
    LIMIT 1;

  /* Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. Your final answer 
    should have 6 values - one for each paper type for the average number of sales, as well as the average amount.*/
    select avg(standard_qty) as avg_standard_qty, avg(standard_qty)as avg_standard_qty, 
      avg(poster_qty) as avg_poster_qty, avg(standard_amt_usd) as avg_standard_amt_usd, 
      avg(gloss_amt_usd ) as avg_gloss_amt_usd, avg(poster_amt_usd) as avg_poster_amt_usd 
      from orders;
  
  --how to calculate the MEDIAN. Though this is more advanced than what we have covered so far try finding - what is the MEDIAN total_usd spent on all orders? Note, this is more advanced than the topics we have covered thus far to build a general solution, but we can hard code a solution in the following way.
    -- HINT TOTAL ROWS ARE 6912 . N/2 IS 3456   we need to find the 3456th row and 3457th row and then take the average of those two rows.
    SELECT *
    FROM (SELECT total_amt_usd
          FROM orders
          ORDER BY total_amt_usd
          LIMIT 3457) AS Table1
    ORDER BY total_amt_usd DESC
    LIMIT 2;

"Group By" USE CASE example:
  -- GROUP BY - GROUPS THE DATA BY A SPECIFIC COLUMN
  --all the data of the same account_id is grouped together and then the sum is calculated for each group
    SELECT account_id,
        SUM(standard_qty) AS standard,
        SUM(gloss_qty) AS gloss,
        SUM(poster_qty) AS poster
    FROM orders
    GROUP BY account_id
    ORDER BY account_id
  
  "Queries on GROUP BY:"
  --Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.
    select a.name,o.occurred_at
    from accounts a
    join orders o
    on a.id=o.id
    order by(o.occurred_at)
    limit 1

  --Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.
    select a.name, sum(total_amt_usd) as total_sales
    from orders o
    join accounts a
    on a.id = o.account_id
    group by a.name;  

  --Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.
    select w.occurred_at, w.channel, a.name
    from web_events w
    join accounts a
    on w.account_id = a.id 
    order by w.occurred_at desc
    limit 1;

  --Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used
    SELECT w.channel, COUNT(*)
    FROM web_events w
    GROUP BY w.channel
  
  --Who was the primary contact associated with the earliest web_event?
    SELECT a.primary_poc
    FROM web_events w
    JOIN accounts a
    ON a.id = w.account_id
    ORDER BY w.occurred_at
    LIMIT 1;

  --What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.
    SELECT a.name, MIN(total_amt_usd) smallest_order
    FROM accounts a
    JOIN orders o
    ON a.id = o.account_id
    GROUP BY a.name
    ORDER BY smallest_order;

  --Find the total number of web_events that occurred before the first order was placed for each account. Your final table should have two columns - the account name and the number of web_events.

  "Multiple group by Columns"
    SELECT a.name, w.channel, COUNT(*)
    FROM web_events w
    JOIN accounts a
    ON a.id = w.account_id
    GROUP BY a.name, w.channel
    ORDER BY a.name, w.channel 

    or 
    
    SELECT account_id, channel, COUNT(id) as events
    FROM web_events
    GROUP BY account_id, channel
    ORDER BY account_id, channel

"Distinct"
  --DISTINCT - REMOVES DUPLICATE VALUES FROM A COLUMN
  /*DISTINCT is always used in SELECT statements, and it provides the unique rows 
  for all columns written in the SELECT statement. Therefore, you only use DISTINCT 
  once in any particular SELECT statement.*/
  -- unique rows for all columns written in the SELECT statement not for the specific column
  exampl 1
    SELECT DISTINCT account_id, channel
    FROM web_events
    ORDER BY account_id
    -- this will return all the unique account_id and channel combinations 

  --query Use DISTINCT to test if there are any accounts associated with more than one region.
    SELECT a.id as "account id", r.id as "region id", 
    a.name as "account name", r.name as "region name"
    FROM accounts a
    JOIN sales_reps s
    ON s.id = a.sales_rep_id
    JOIN region r
    ON r.id = s.region_id;
    --AND
    SELECT DISTINCT id, name
    FROM accounts;
    --If both queries results same number of rows then there are no accounts associated with more than one region.

    --QUERY 2 Have any sales reps worked on more than one account?
    SELECT s.id, s.name, COUNT(*) num_accounts
    FROM accounts a
    JOIN sales_reps s
    ON s.id = a.sales_rep_id
    GROUP BY s.id, s.name
    ORDER BY num_accounts;
    --AND
    SELECT DISTINCT id, name
    FROM sales_reps;
    --If both queries results same number of rows then there are no sales reps worked on more than one account.