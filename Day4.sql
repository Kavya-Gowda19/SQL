1.What is SQL? 
Answer: SQL (Structured Query Language) is a standardized programming language used to manage and manipulate relational databases. It allows users to query, update, insert, 
        delete, and manage data stored in databases. 

2.What is DBMS?
Answer: DBMS(Database Management System) is softare used to store, manage and retrive data efficiently.Examples include MySQL,Oracle and SQL Server.
  
2.What are the different types of SQL commands? 
Answer: SQL commands are categorized into: 
        ●	DDL (Data Definition Language): CREATE, ALTER, DROP, TRUNCATE. 
        ●	DML (Data Manipulation Language): SELECT, INSERT, UPDATE, DELETE. 
        ●	DCL (Data Control Language): GRANT, REVOKE. 
        ●	TCL (Transaction Control Language): COMMIT, ROLLBACK, SAVEPOINT. 
        (DQL :SELECT)
  
3.What is the difference between DELETE and TRUNCATE? 
Answer: DELETE removes rows one by one and can be rolled back. 
        TRUNCATE removes all rows from a table without logging individual row deletions and cannot be rolled back. 
  
4.What is the difference between DROP and TRUNCATE? 
Answer: DROP removes the table structure and data permanently, whereas TRUNCATE only removes data but keeps the table structure intact. 
  
5.What is a primary key? 
Answer: A primary key uniquely identifies each record in a table and cannot contain NULL values. 
  
6.What is a foreign key? 
Answer: A foreign key is a column that establishes a relationship between two tables, ensuring referential integrity. 
  
7.What is a unique key? 
Answer: A unique key prevents duplicate values in a column but allows NULL values (unlike a primary key). 
  
8.What is a composite key? 
Answer:composite key is a combination of two or more columns used to uniquely identify a record. 

9.	What is a candidate key? 
Answer: A candidate key is a column (or set of columns) that can qualify as a primary key. 
  
10.	What is a super key? 
Answer: A super key is a set of one or more columns that uniquely identify a row in a table. 

11.	What are the different types of joins? 
Answer: -INNER JOIN: Returns only matching records from both tables. 
        -	LEFT JOIN: Returns all records from the left table and matching ones from the right. 
        -	RIGHT JOIN: Returns all records from the right table and matching ones from the left. 
        -	FULL JOIN: Returns all records when a match exists in either table. 
 
12.	What is the difference between UNION and UNION ALL? 
Answer: UNION removes duplicates, while UNION ALL retains all records including duplicates. 

13.	What is an index in SQL? 
Answer: An index improves the speed of data retrieval operations in a database table. 
 
14.	What are the types of indexes? 
Answer: Primary Index, Unique Index, Composite Index, Clustered Index, Non-clustered Index. 
 
15.	How does an index improve performance? 
Answer: Indexes reduce the number of disk I/O operations by allowing quick lookups. 
 
16.	What are the disadvantages of indexing? 
Answer: Indexes consume additional storage and slow down DML operations like INSERT and UPDATE. 

19.	How do you optimize an SQL query? 
Answer: Use indexes, avoid SELECT \*, use proper joins, normalize tables, analyze execution plans. 
 
20.	What is a subquery? 
Answer: A query inside another query that provides input data for the main query. 
 
21.	What is a correlated subquery? 
subquery that depends on the outer query for its execution. 
 
22.	What is the difference between a view and a table? 
Answer: A view is a virtual table based on a query, whereas a table is a physical data storage structure. 

23.	Can we perform DML operations on a view? 
Answer: Yes, but only if the view does not contain joins, aggregations, or calculated columns. 
 
24.	What is the CHECK constraint? 
Answer: Ensures that all values in a column satisfy a specific condition. 
 
25.	What is the DEFAULT constraint? 
Answer: Assigns a default value to a column if no value is specified. 
 
26.	What is the difference between NOT NULL and NULL constraints? 
Answer: NOT NULL ensures that a column cannot have NULL values, while NULL allows missing values. 

27.	What are ACID properties? 
Answer: -	Atomicity: Transactions are all-or-nothing. 
        -	Consistency: Ensures data integrity. 
        -	Isolation: Prevents concurrent transaction interference
        - Durability: Ensures permanence of committed data 
  
28.	What are transactions in SQL? 
Answer: A sequence of SQL operations performed as a single unit of work. 
  
29.	What is the difference between COMMIT and ROLLBACK? 
Answer: COMMIT saves changes, ROLLBACK undoes changes. 
  
30.	What is the difference between HAVING and WHERE clause? 
Answer: The WHERE clause is used to filter records before grouping (used with SELECT, UPDATE, DELETE statements), whereas the HAVING clause is used to filter records after grouping 
        (used with GROUP BY to filter aggregate results). 
  
31.	What is the difference between UNION and UNION ALL? 
 Answer: UNION combines the result sets of two queries and removes duplicates. 
         UNION ALL combines the result sets without removing duplicates, making it faster. 
  
32.	What is the difference between RANK(), DENSE_RANK(), and ROW_NUMBER()? 
 Answer: ●	ROW_NUMBER(): Assigns a unique sequential number to each row. 
         ●	RANK(): Assigns a ranking to rows, but skips numbers when duplicate values exist. 
         ●	DENSE_RANK(): Similar to RANK(), but does not skip numbers. 
  
33.	What are stored procedures? 
 Answer: A stored procedure is a precompiled SQL script that can be executed multiple times. It improves performance and security. 
  
34.	What is a trigger in SQL? 
 Answer: A trigger is a stored procedure that automatically runs when a specific event (INSERT, UPDATE, DELETE) occurs in a table. 
  
35.	What is the difference between HAVING and WHERE? 
 Answer: ●	WHERE filters records before aggregation (SUM, AVG, etc.). 
         ●	HAVING filters aggregated records after GROUP BY is applied. 
  
36.	What is normalization? Why is it needed?  
 Answer: Normalization is the process of organizing data to eliminate redundancy and improve efficiency. 
         It prevents anomalies and ensures data integrity. 
  
37.	What are different types of normalization? 
 Answer: 
  ●	1NF: Eliminate duplicate columns and ensure atomicity. 
  ●	2NF: Remove partial dependencies (all non-key attributes must depend on the whole primary key). 
  ●	3NF: Remove transitive dependencies. 
  ●	BCNF: Every determinant is a candidate key. 

38.	What is denormalization? 
 Answer: Denormalization is the process of merging tables to improve query performance, often used in data warehousing. 
  
39.	What is the difference between clustered and non-clustered indexes? 
 Answer: ●	Clustered Index: Sorts and stores data physically in order (only one per table). 
         ●	Non-Clustered Index: Creates a separate structure pointing to the actual data (multiple per table). 
  
40.	What is an execution plan in SQL? 
 Answer: An execution plan shows how SQL Server will execute a query. It helps optimize performance by identifying bottlenecks. 

 

















  


           
