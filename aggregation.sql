--NULL
    -- NULLs are different than a zero - they are cells where data does not exist.
    --When identifying NULLs in a WHERE clause, we write IS NULL or IS NOT NULL. We don't use =, because NULL isn't considered a value in SQL. Rather, it is a property of the data.
  SELECT *
  FROM accounts
  WHERE primary_poc = NULL
  "AND"-- FOR NOT NULL
  SELECT *
  FROM accounts
  WHERE primary_poc IS NOT NULL
