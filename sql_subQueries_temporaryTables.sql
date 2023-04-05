"Subquery"
        --Definition: A subquery is a query nested within another query.
        --a query has both SELECT and FROM clauses to signify what you want to extract from a table and what table you’d like to pull data from. A query that includes subquery, 
            --as a result, has multiple SELECT and FROM clauses.
        --The subquery that sits nested inside a larger query is called an INNER QUERY. This inner query can be fully executed on its own and often is run independently before 
            --when trying to troubleshoot bugs in your code.

    --example
    SELECT product_id,name,price
    FROM db.product
    Where price > (SELECT AVG(price)
              FROM db.product)

    "Use Cases:"
        --Subquery: When an existing table needs to be manipulated or aggregated to then be joined to a larger table.
        --Joins: A fully flexible and discretionary use case where a user wants to bring two or more tables together and select and filter as needed.

        --Subquery: A subquery is a query within a query. The syntax, as a result, has multiple SELECT and FROM clauses.
        --Joins: A join is a way to combine two or more tables together. The syntax, as a result, has a single SELECT and FROM clause.

        --Both subqueries and joins are essentially bringing multiple tables together (whether an existing table is first manipulated or not) to generate a single output.


