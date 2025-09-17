1.What is SQL? 
Answer: SQL (Structured Query Language) is a standardized programming language used to manage and manipulate relational databases. It allows users to query, update, insert, 
        delete, and manage data stored in databases. 

2.What is DBMS?
Answer: DBMS(Database Management System) is softare used to store, manage and retrive data efficiently.Examples include MySQL,Oracle and SQL Server.
  
3.What are the different types of SQL commands? 
Answer: SQL commands are categorized into: 
        ●	DDL (Data Definition Language): CREATE, ALTER, DROP, TRUNCATE. 
        ●	DML (Data Manipulation Language): SELECT, INSERT, UPDATE, DELETE. 
        ●	DCL (Data Control Language): GRANT, REVOKE. 
        ●	TCL (Transaction Control Language): COMMIT, ROLLBACK, SAVEPOINT. 
        (DQL :SELECT)
  
4.What is the difference between DELETE and TRUNCATE? 
Answer: DELETE removes rows one by one and can be rolled back. 
        TRUNCATE removes all rows from a table without logging individual row deletions and cannot be rolled back. 
  
5.What is the difference between DROP and TRUNCATE? 
Answer: DROP removes the table structure and data permanently, whereas TRUNCATE only removes data but keeps the table structure intact. 
  
6.What is a primary key? 
Answer: A primary key uniquely identifies each record in a table and cannot contain NULL values. 
  
7.What is a foreign key? 
Answer: A foreign key is a column that establishes a relationship between two tables, ensuring referential integrity. 
ex:
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
  
8.What is a unique key? 
Answer: A unique key prevents duplicate values in a column but allows NULL values (unlike a primary key). 
  
9.What is a composite key? 
Answer:composite key is a combination of two or more columns used to uniquely identify a record. 

10.	What is a candidate key? 
Answer: A candidate key is a column (or set of columns) that can qualify as a primary key. 
  
11.	What is a super key? 
Answer: A super key is a set of one or more columns that uniquely identify a row in a table. 

12.	What are the different types of joins? 
Answer: -INNER JOIN: Returns only matching records from both tables. 
        -	LEFT JOIN: Returns all records from the left table and matching ones from the right. 
        -	RIGHT JOIN: Returns all records from the right table and matching ones from the left. 
        -	FULL JOIN: Returns all records when a match exists in either table. 
 
13.	What is the difference between UNION and UNION ALL? 
Answer: UNION removes duplicates, while UNION ALL retains all records including duplicates. 

14.	What is an index in SQL? 
Answer: An index improves the speed of data retrieval operations in a database table. 
 
15.	What are the types of indexes? 
Answer: Primary Index, Unique Index, Composite Index, Clustered Index, Non-clustered Index. 
 
16.	How does an index improve performance? 
Answer: Indexes reduce the number of disk I/O operations by allowing quick lookups. 
 
17.	What are the disadvantages of indexing? 
Answer: Indexes consume additional storage and slow down DML operations like INSERT and UPDATE. 

18.	How do you optimize an SQL query? 
Answer: Use indexes, avoid SELECT \*, use proper joins, normalize tables, analyze execution plans. 
 
19.	What is a subquery? 
Answer: A query inside another query that provides input data for the main query. 
 
20.	What is a correlated subquery? 
subquery that depends on the outer query for its execution. 
 
21.	What is the difference between a view and a table? 
Answer: A view is a virtual table based on a query, whereas a table is a physical data storage structure. 

22.	Can we perform DML operations on a view? 
Answer: Yes, but only if the view does not contain joins, aggregations, or calculated columns. 
 
23.	What is the CHECK constraint? 
Answer: Ensures that all values in a column satisfy a specific condition. 
 
24.	What is the DEFAULT constraint? 
Answer: Assigns a default value to a column if no value is specified. 
 
25.	What is the difference between NOT NULL and NULL constraints? 
Answer: NOT NULL ensures that a column cannot have NULL values, while NULL allows missing values. 

26.	What are ACID properties? 
Answer: ●	Atomicity: All operations succeed or none occur. 
        ●	Consistency: Ensures data integrity. 
        ●	Isolation: Transactions are independent. 
        ●	Durability: Data is permanently stored after a transaction. 

       1. Atomicity
          Atomicity ensures that all operations in a transaction are treated as a single unit.
          If one operation fails, the entire transaction fails — no partial updates occur.
          Example:
          Transferring ₹100 from Account A to B:
          Debit ₹100 from Account A ✔️
          Credit ₹100 to Account B ❌ (Fails)
          Since one step failed, the debit is rolled back, and no money is lost or moved.

        2. Consistency
          Consistency ensures that a transaction brings the database from one valid state to another, following all integrity rules (like foreign keys, data types, and constraints).
          Example:
          After a ₹100 transfer:
          Total balance in the system should remain the same.
          No rules (like "balance must be ≥ 0") are violated.
          If rules are violated, the transaction fails and does not affect the database.

        3. Isolation
           Isolation ensures that multiple transactions happening at the same time do not affect each other.
           Each transaction runs as if it is the only one in the system.
           Example:
           Two users try to book the last seat on a train:
           Both click "Book" at the same time.
           Only one transaction should succeed.
           Isolation prevents double booking by handling transactions one at a time in the background.
     
        4. Durability
           Durability guarantees that once a transaction is successfully committed, the changes are permanent, even if the system crashes or loses power immediately afterward.
           Example:
           If a bank transfer is marked "Successful", and power goes out,When the system restarts, the transfer is still complete.
           No need to redo or reverify the transaction.
           The database stores the final state safely — typically using logs or backups.
 
27.	What are transactions in SQL? 
Answer: A sequence of SQL operations performed as a single unit of work. 
  
28.	What is the difference between COMMIT and ROLLBACK? 
Answer: COMMIT saves changes, ROLLBACK undoes changes. 
  
29.	What is the difference between HAVING and WHERE clause? 
Answer: The WHERE clause is used to filter records before grouping (used with SELECT, UPDATE, DELETE statements), whereas the HAVING clause is used to filter records after grouping 
        (used with GROUP BY to filter aggregate results). 
  
30.	What is the difference between UNION and UNION ALL? 
 Answer: UNION combines the result sets of two queries and removes duplicates. 
         UNION ALL combines the result sets without removing duplicates, making it faster. 
  
31.	What is the difference between RANK(), DENSE_RANK(), and ROW_NUMBER()? 
 Answer: ●	ROW_NUMBER(): Assigns a unique sequential number to each row. 
         ●	RANK(): Assigns a ranking to rows, but skips numbers when duplicate values exist. 
         ●	DENSE_RANK(): Similar to RANK(), but does not skip numbers. 
  
32.	What are stored procedures? 
 Answer: A stored procedure is a precompiled SQL script that can be executed multiple times. It improves performance and security. 
  
33.	What is a trigger in SQL? 
 Answer: A trigger is a stored procedure that automatically runs when a specific event (INSERT, UPDATE, DELETE) occurs in a table. 
  
34.	What is the difference between HAVING and WHERE? 
 Answer: ●	WHERE filters records before aggregation (SUM, AVG, etc.). 
         ●	HAVING filters aggregated records after GROUP BY is applied. 
  
35.	What is normalization? Why is it needed?  
 Answer: Normalization is the process of organizing data to eliminate redundancy and improve efficiency. 
         It prevents anomalies and ensures data integrity. 
  
36.	What are different types of normalization? 
 Answer: 
  ●	1NF: NO repeating groups or arrays,each field shold cotain atomic values. 
  ●	2NF: Remove partial dependencies (all non-key attributes must depend on the whole primary key). 
  ●	3NF: Remove transitive dependencies. 
  ●	BCNF: Every determinant is a candidate key. 

        1. First Normal Form (1NF):
          A table is in 1NF if:
          * All attributes (columns) contain **atomic (indivisible) values**
          * Each record (row) is **unique**

        Example – Not in 1NF**:

                          | StudentID | Name  | Subjects         |
                          | --------- | ----- | ---------------- |
                          | 101       | Kavya | Math, English    |
                          | 102       | Meena | Science, Kannada |

         Problem: "Subjects" column has "multiple values".
         1NF Version:
                                | StudentID | Name  | Subject |
                                | --------- | ----- | ------- |
                                | 101       | Kavya | Math    |
                                | 101       | Kavya | English |
                                | 102       | Meena | Science |
                                | 102       | Meena | Kannada |

          Now Each cell now has "only one value" – atomic format.

       2. Second Normal Form (2NF)
          A table is in "2NF" if:
          * It is already in "1NF"
          * "All non-key columns" are "fully dependent" on the "entire primary key"

         Example – Not in 2NF:
                        | StudentID | CourseID | StudentName | CourseName |
                        | --------- | -------- | ----------- | ---------- |
                        | 101       | C1       | Kavya       | Java       |
                        | 102       | C2       | Meena       | Python     |

        Primary Key: (StudentID, CourseID)
        "Issue": StudentName depends 'only on StudentID", not on CourseID → "Partial Dependency"

        2NF Version:

        Student Table:

                        | StudentID | StudentName |
                        | --------- | ----------- |
                        | 101       | Kavya       |
                        | 102       | Meena       |

       Course Table:

                        | CourseID | CourseName |
                        | -------- | ---------- |
                        | C1       | Java       |
                        | C2       | Python     |

       Enrollment Table:

                        | StudentID | CourseID |
                        | --------- | -------- |
                        | 101       | C1       |
                        | 102       | C2       |

       All columns now depend on the full key → no partial dependency.



      3. Third Normal Form (3NF)
        A table is in "3NF" if:
        * It is in "2NF"
        * There are "no transitive dependencies"(non-key columns do "not depend" on other non-key columns)

        Example – Not in 3NF:

                        | EmpID | EmpName | DeptID | DeptName |
                        | ----- | ------- | ------ | -------- |
                        | 1     | Kavya   | D1     | HR       |
                        | 2     | Meena   | D2     | IT       |

         DeptName depends on DeptID, "not EmpID" → "transitive dependency".

         3NF Version:

        Employee Table:

                        | EmpID | EmpName | DeptID |
                        | ----- | ------- | ------ |
                        | 1     | Kavya   | D1     |
                        | 2     | Meena   | D2     |

        Department Table:

                        | DeptID | DeptName |
                        | ------ | -------- |
                        | D1     | HR       |
                        | D2     | IT       |

         Now, "DeptName is separated" and linked by DeptID → no transitive dependency.

        4. Boyce-Codd Normal Form (BCNF)
           A table is in "BCNF" if:
           * It is in "3NF"
           * And "every determinant" is a "candidate key"

           BCNF handles "edge cases" where 3NF is satisfied but "still has anomalies" due to non-candidate keys determining other attributes.
           Example – Not in BCNF:

                                | Course | Instructor | Room |
                                | ------ | ---------- | ---- |
                                | Java   | Kavya      | R1   |
                                | Python | Kavya      | R2   |

                  * One Course is taught by one Instructor
                  * But one Instructor teaches multiple Courses

          `Instructor → Room` but Instructor is "not a candidate key"→ violates BCNF.
          
           BCNF Version:

           Instructor Table**:
                                | Instructor | Room |
                                | ---------- | ---- |
                                | Kavya      | R1   |

           Course Table**:
                                | Course | Instructor |
                                | ------ | ---------- |
                                | Java   | Kavya      |
                                | Python | Kavya      |

           Now every "determinant is a candidate key".

                                  Summary Table:

                | Normal Form | Condition                                  | Removes...               |
                | ----------- | ------------------------------------------ | ------------------------ |
                | 1NF         | Atomic values, unique rows                 | Repeating groups         |
                | 2NF         | 1NF + No partial dependency                | Partial dependency       |
                | 3NF         | 2NF + No transitive dependency             | Transitive dependency    |
                | BCNF        | 3NF + Every determinant is a candidate key | Some edge-case anomalies |


37.	What is denormalization? 
 Answer: Denormalization is the process of merging tables to improve query performance, often used in data warehousing. 
  
38.	What is the difference between clustered and non-clustered indexes? 
 Answer: ●	Clustered Index: Sorts and stores data physically in order (only one per table). 
         ●	Non-Clustered Index: Creates a separate structure pointing to the actual data (multiple per table). 
  
39.	What is an execution plan in SQL? 
 Answer: An execution plan shows how SQL Server will execute a query. It helps optimize performance by identifying bottlenecks. 

40.	What is the difference between OLTP and OLAP?  
Answer: ●	OLTP (Online Transaction Processing): Handles day-to-day transactions (e.g., banking). 
        ●	OLAP (Online Analytical Processing): Used for data analysis and reporting (e.g., BI tools). 

41.	What is the COALESCE function in SQL?  
Answer: COALESCE returns the first non-null value from a list of expressions. 
        
42.	What is a cursor in SQL?  
Answer: A cursor is a database object used to retrieve, manipulate, and traverse row-by-row processing. 
        
43.	What is indexing in SQL, and why is it important?  
Answer: Indexing speeds up data retrieval by creating a data structure for quick lookups. 
        
44.	What is the difference between DELETE and TRUNCATE? 
Answer: ●	DELETE: Removes specific rows with a WHERE condition and can be rolled back. 
        ●	TRUNCATE: Removes all rows and resets identity but cannot be rolled back. 
        
45.	What is the difference between a primary key and a unique key? 
Answer: ●	Primary Key: Uniquely identifies a row, does not allow NULL, and only one per table. 
        ●	Unique Key: Ensures uniqueness but allows one NULL value and multiple unique keys per table. 
        
46.	What is the difference between CHAR and VARCHAR? 
Answer: ●	CHAR: Fixed-length storage, faster retrieval. 
        ●	VARCHAR: Variable-length storage, saves space. 
 
 
 



 

















  


           
