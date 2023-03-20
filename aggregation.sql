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
    723646

  --Find the total amount of standard_qty paper ordered in the orders table.
    SELECT SUM(standard_qty) as total_amount_standard_qty
    FROM ORDERS
    1938346

  --Find the total dollar amount of sales using the total_amt_usd in the orders table.
    SELECT SUM(total_amt_usd) as total_sales_total_amt_usd
    FROM ORDERS
    23141511.83
  
  