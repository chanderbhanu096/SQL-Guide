"Window Function" 
    "Defintion"
       /* A window function performs a calculation across a set of table rows that are somehow related to the current row. 
       This is comparable to the type of calculation that can be done with an aggregate function. But unlike regular aggregate 
       functions, use of a window function does not cause rows to become grouped into a single output row — the rows retain their 
       separate identities. Behind the scenes, the window function is able to access more than just the current row of the query result.
         */ 
    "Use Cases"
    --Example--
    --1. how to compare each employee's salary with the average salary in his or her department:
        SELECT depname, empno, salary, avg(salary) OVER (PARTITION BY depname) FROM empsalary;
        "Explanation" /*
            the first three output columns come directly from the table empsalary, and there 
            is one output row for each row in the table. The fourth column represents an average taken 
            across all the table rows that have the same depname value as the current row. (This actually 
            is the same function as the regular avg aggregate function, but the OVER clause causes it to be treated 
            as a window function and computed across an appropriate set of rows.)*/

    "can also control the order in which rows are processed by window functions using ORDER BY within OVER."
        SELECT depname, empno, salary, rank() OVER (PARTITION BY depname ORDER BY salary DESC) FROM empsalary;

    "to calculate sum of the salary column and showing in sum column for every employee"
        SELECT salary, sum(salary) OVER () FROM empsalary;
    
