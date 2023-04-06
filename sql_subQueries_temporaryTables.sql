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

        example:
        steps:
            --1. Create a subquery that aggregates the average price of all products.
            --2. Join the subquery to the products table to select the product_id, name, and price of all products that are more expensive than the average price.
        
        1.--First, we needed to group by the day and channel.
        SELECT DATE_TRUNC('day',occurred_at) AS day,
        channel, COUNT(*) as events
        FROM web_events
        GROUP BY 1,2
        ORDER BY 3 DESC;

        2.--Then, we needed to group by the channel and calculate the average number of events per day.
        Select channel,Avg(events) as average_events
        from 
            (SELECT DATE_TRUNC('day',occurred_at) AS day,
       	    channel, COUNT(*) as events
		    FROM web_events
		    GROUP BY 1,2
		    ORDER BY 3 DESC) sub --subquery
        GROUP BY channel
		ORDER BY 2 DESC;
        

