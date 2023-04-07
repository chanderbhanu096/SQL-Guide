"Various data cleaning methods definition and when to use"
    --Left/Right/Substr: Used to extract information typically when all information resides in a single column
    --Concat: Used commonly when two or more pieces of information can be used as a unique identifier
    --Cast: Used when data types default to a specific type (e.g., most commonly STRING) and need to be 
       --assigned to the appropriate data type to run computations

"Left/Right/Substr"
    --Definition: Used to extract information typically when all information resides in a single column
    --Use Case: Extracting information from a single column
    --Example: Extracting the first 3 characters from a column
    "name from the query is the column name"
        SELECT LEFT(name,3) FROM db.table;
    --Example: Extracting the last 3 characters from a column
        SELECT RIGHT(name,3) FROM db.table;
    --Example: Extracting the 3rd to 3+5th characters from a column
        syntax : SUBSTR(string, start, length)
        SELECT SUBSTR(name,3,5) FROM db.table;

    -- QUERIES FOR PRACTICE
    1. /*In the accounts table, there is a column holding the website for each company. The last three digits specify what type of web address they are using. 
      A list of extensions (and pricing) is provided here. Pull these extensions and provide how many of each website type exist in the accounts table. */
        select right(website,3) as domain_Type, count(*) as repetitions
        from accounts
        group by domain_Type
        order by repetitions
    2. /*There is much debate about how much the name (or even the first letter of a company name) matters. Use the accounts table to pull the first letter
     of each company name to see the distribution of company names that begin with each letter (or number).*/
        select substr(website,5,1) as name_of_company, count(*) as repetitions
        from accounts
        group by name_of_company
        order by repetitions



