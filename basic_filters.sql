-- HERE COLUMNS NAME ARE occurred_at,account_id,channel and table name is web_events where it will limit the number of rows to 15
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

-- THE CODE BELOW HELP THE OUTPUT IN A ORDERED WAY
ORDER BY table_name -- WILL ORDER THE LIST IN ASCENDING ORDER BY DEFAULT
ORDER BY table_name DESC   -- DESC MEANS DESCENDING ORDERED

--EXAMPLE
SELECT *
FROM orders
ORDER BY occurred_at
LIMIT 1000;

--Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

--Write a query to return the top 5 orders in terms of the largest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

--Write a query to return the lowest 20 orders in terms of the smallest total_amt_usd. Include the id, account_id, and total_amt_usd.
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;

--//Derived Columns or creating new columns by applying airthmatic on other columns
SELECT id, (standard_amt_usd/total_amt_usd)*100 AS std_percent, total_amt_usd
FROM orders
LIMIT 10;
--HERE std_percent is the new columns

SELECT account_id,
       occurred_at,
       standard_qty,
       gloss_qty + poster_qty AS nonstandard_qty
FROM orders
--here nonstandard_qty is the derived columns

query--Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields.
select id,
	   account_id,
       standard_amt_usd,
       standard_qty,
       (standard_amt_usd/standard_qty) as unit_price
from orders
limit 10;



  --  1.LIKE This allows you to perform operations similar to using WHERE and =,but for cases when you might not know exactly what you are looking for.

  --  2.IN This allows you to perform operations similar to using WHERE and =, but for more than one condition.

  --  3.NOT This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.

  --  4.AND & BETWEEN These allow you to combine operations where all combined conditions must be true.

  --  5.OR This allows you to combine operations where at least one of the combined conditions must be true.
wild cards = % means any number of characters

*******Important 'LIKE' USECASE *******

            SELECT *
            FROM accounts
            WHERE website LIKE '%google%';

            QUERY--All the companies whose names start with 'C'.
            select *
            from accounts
            where name like 'C%'

            query--All companies whose names contain the string 'one' somewhere in the name.
            select *
            from accounts
            where name like '%one%'

            query--All companies whose names end with 's'.
            select *
            from accounts
            where name like '%s'

*******Important 'IN' USECASE is allow use of  = for more than one value *******
            SELECT *
            FROM orders
            WHERE account_id IN (1001,1021);

            QUERY -- Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Target, and Nordstrom.
            select name, primary_poc,sales_rep_id
            from accounts
            where name in('Walmart','Target','Nordstrom');


             query--Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.
            select *
            from web_events
            where channel in('organic','adwords');

*******Important 'NOT' *******
        --The NOT operator is an extremely useful operator for working with the previous two operators we introduced: IN and LIKE. By specifying NOT LIKE or NOT IN, we can grab all of the rows that do not meet particular criteria.
        SELECT sales_rep_id,
               name
        FROM accounts
        WHERE sales_rep_id NOT IN (321500,321570)
        ORDER BY sales_rep_id

        example 2
        SELECT *
        FROM accounts
        WHERE website NOT LIKE '%com'

        query --'Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.'
        select name, primary_poc,sales_rep_id
        from accounts
        where name not in('Walmart','Target','Nordstrom');

        query --Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.
        select *
        from web_events
        where channel not in('organic','adwords');

        query --All the companies whose names do not start with 'C'.
        select *
        from accounts
        where name not like 'C%'

        query--All companies whose names do not contain the string 'one' somewhere in the name.
        select *
        from accounts
        where name not like '%one%'

        query--All companies whose names do not end with 's'.
        select *
        from accounts
        where name not like '%s'

*******Important 'AND & Between' *******
      --The AND operator is used within a WHERE statement to consider more than one logical clause at a time. Each time you link a new statement with an AND, you will need to specify the column you are interested in looking at. You may link as many statements as you would like to consider at the same time. This operator works with all of the operations we have seen so far including arithmetic operators (+, *, -, /). LIKE, IN, and NOT logic can also be linked together using the AND operator.
      WHERE column >= 6 AND column <= 10
              --OR
      WHERE column BETWEEN 6 AND 10

      SELECT *
      FROM orders
      WHERE occurred_at >= '2016-04-01' AND occurred_at <= '2016-10-01'
      ORDER BY occurred_at
            --OR
      SELECT *
      FROM orders
      WHERE occurred_at BETWEEN '2016-04-01' AND '2016-10-01'
      ORDER BY occurred_at

      and usecase
      QUERY--Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.
      select *
      from orders
      where standard_qty>1000 and poster_qty=0 and gloss_qty=0;

      query--Using the accounts table, find all the companies whose names do not start with 'C' and end with 's
      not+and use

      select *
      from accounts
      where not (name='c%' and name = '%s');

      QUERY --When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not.
      You should notice that there are a number of rows in the output of this query where the **gloss_qty** values are 24 or 29. So the answer to the question is that yes, the BETWEEN operator in SQL is inclusive; that is, the endpoint values are included. So the BETWEEN statement in this query is equivalent to having written: "WHERE gloss_qty >= 24 AND gloss_qty <= 29."

      query --Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.
      select *
      from web_events
      where channel in('organic','adwords') and occurred_at	BETWEEN '2016-01-01' AND '2017-01-01'
      order by occurred_at;

*******Important 'OR' *******
        --Similar to the AND operator, the OR operator can combine multiple statements. Each time you link a new statement with an OR, you will need to specify the column you are interested in looking at. You may link as many statements as you would like to consider at the same time. This operator works with all of the operations we have seen so far including arithmetic operators (+, *, -, /), LIKE, IN, NOT, AND, and BETWEEN logic can all be linked together using the OR operator.

        example
        SELECT account_id,
               occurred_at,
               standard_qty,
               gloss_qty,
               poster_qty
        FROM orders
        WHERE standard_qty = 0 OR gloss_qty = 0 OR poster_qty = 0

        example2
        SELECT account_id,
               occurred_at,
               standard_qty,
               gloss_qty,
               poster_qty
        FROM orders
        WHERE (standard_qty = 0 OR gloss_qty = 0 OR poster_qty = 0)
        AND occurred_at = '2016-10-01'

        QUERY--Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table
        select id
        from orders
        where gloss_qty>4000 or poster_qty>4000;

        QUERY--Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000
        select *
        from orders
        where (gloss_qty>1000 or poster_qty>1000) and standard_qty=0;

        QUERY--Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.
        select *
        from accounts
        where (name like'C%' or name like 'W%') and ((primary_poc='Ana' or primary_poc='ana') and primary_poc NOT LIKE '%eana%');


You have already learned a lot about writing code in SQL! Let's take a moment to recap all that we have covered before moving on:
Statement 	How to Use It 	Other Details
SELECT 	SELECT Col1, Col2, ... 	Provide the columns you want
FROM 	FROM Table 	Provide the table where the columns exist
LIMIT 	LIMIT 10 	Limits based number of rows returned
ORDER BY 	ORDER BY Col 	Orders table based on the column. Used with DESC.
WHERE 	WHERE Col > 5 	A conditional statement to filter your results
LIKE 	WHERE Col LIKE '%me%' 	Only pulls rows where column has 'me' within the text
IN 	WHERE Col IN ('Y', 'N') 	A filter for only rows with column of 'Y' or 'N'
NOT 	WHERE Col NOT IN ('Y', 'N') 	NOT is frequently used with LIKE and IN
AND 	WHERE Col1 > 5 AND Col2 < 3 	Filter rows where two or more conditions must be true
OR 	WHERE Col1 > 5 OR Col2 < 3 	Filter rows where at least one condition must be true
BETWEEN 	WHERE Col BETWEEN 3 AND 5 	Often easier syntax than using an AND
Key Terms
KeyTerm 	Definition
CREATE TABLE 	is a statement that creates a new table in a database.
DROP TABLE 	is a statement that removes a table in a database.
Entity-relationship diagram (ERD) 	A common way to view data in a database.
FROM 	specifies from which table(s) you want to select the columns. Notice the columns need to exist in this table.
SELECT 	allows you to read data and display it. This is called a query and it specifies from which table(s) you want to select the columns.
Other Tips

Though SQL is not case sensitive (it doesn't care if you write your statements as all uppercase or lowercase), we discussed some best practices. The order of the key words does matter! Using what you know so far, you will want to write your statements as:

SELECT col1, col2
FROM table1
WHERE col3  > 5 AND col4 LIKE '%os%'
ORDER BY col5
LIMIT 10;

Notice, you can retrieve different columns than those being used in the ORDER BY and WHERE statements. Assuming all of these column names existed in this way (col1, col2, col3, col4, col5) within a table calledtable1, this query would run just fine.
Lesson Overview

Now that we have completed this lesson we have covered the following and you are able to:

    Describe why SQL is important
    Explain how SQL data is stored and structured
    Create SQL queries using proper syntax including
        SELECT & FROM
        LIMIT
        ORDER BY
        WHERE
        Basic arithmetic operations
        LIKE
        IN
        NOT
        AND & BETWEEN & OR
