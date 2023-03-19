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

-- COUNT - COUNTS THE NUMBER OF ROWS IN A TABLE
  SELECT COUNT(*)
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

-- 