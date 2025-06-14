Note :1.IN :The IN Operator in SQL is used to specify multiple values/sub-queries in the WHERE clause. It provides an easy way to handle multiple OR condition.
            In general, we can only use one condition in the Where clause, but the IN operator allows us to specify multiple values.
            SELECT * FROM Customers
            WHERE Country IN ('Germany', 'France', 'UK');
            SELECT * FROM Customers
            WHERE CustomerID IN (SELECT CustomerID FROM Orders);
            SELECT * FROM Customers
            WHERE CustomerID NOT IN (SELECT CustomerID FROM Ord

      2.BETWEEN :The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
                 SELECT * FROM Products
                 WHERE Price BETWEEN 10 AND 20;     //WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#; or '1996-07-01' AND '1996-07-31'

      3.SELECT TOP :The SELECT TOP clause is used to specify the number of records to return.
                    SELECT TOP 3 * FROM Customers; (not aplicable to mysql)
 
                   Not all database systems support the SELECT TOP clause. MySQL supports the LIMIT clause to select a limited number of records
      4.SQL Aliases :SQL aliases are used to give a table, or a column in a table, a temporary name
                    SELECT CustomerID AS ID    //CustomerID ID
                    FROM Customers;  //AS is optional
                   Using "double quotes" for aliases with space characters:
                                                                          SELECT ProductName AS "My Great Products"
                                                                          FROM Products;
 ******5.ON DELETE CASCADE - when a record in the parent table is deleted, all corresponding records in the child table are automatically deleted as well.
       7.JOINS:
        a)INNER JOIN : Returns records that have matching values in both tables
                     -JOIN or INNER JOIN will return the same result.
                     -*The INNER JOIN keyword returns only rows with a match in both tables. Which means that if you have a product with no CategoryID, 
                       or with a CategoryID that is not present in the Categories table, that record would not be returned in the result.


                      Example:
                     -SELECT column_name(s)
                      FROM table1
                      INNER JOIN table2
                      ON table1.column_name = table2.column_name;

                     -SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
                      FROM ((Orders
                      INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
                      INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

        b)LEFT JOIN: Returns all records from the left table, and the matched records from the right table.if no match is found in right side then 
                     it will return null values
                    -SELECT column_name(s)
                     FROM table1
                     LEFT JOIN table2
                     ON table1.column_name = table2.column_name;

        c)RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
                    -If there is no match in the Left table, the result will have NULL values for columns from the Left table
                    -SELECT column_name(s)
                     FROM table1
                     RIGHT JOIN table2
                     ON table1.column_name = table2.column_name;

        d)FULLJOIN: Returns all records when there is a match in either left or right table
                   -If there is no match in the right table, the result will have NULL values for columns from the right table.
                   -SELECT Customers.CustomerName, Orders.OrderID
                    FROM Customers
                    FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
                    ORDER BY Customers.CustomerName;

        e)NATURAL JOIN :It creates a join on the base of the common columns in the tables. 
                        -To perform natural join there must be one common attribute(Column) between two tables.
                        -It deletes the duplicate attribute(prints only once)
                        -SELECT *
                         FROM TABLE1
                         NATURAL JOIN TABLE2;


        f)SELF JOIN:is a join where a table is joined with itself. It is used when we need to compare rows within the same table.
                   -A table is treated as if it were two separate tables (using aliases).
                    Typically used when comparing rows within the same table (e.g., hierarchical relationships like employees and managers).
                   -SELECT e1.emp_name AS Employee, e2.emp_name AS Manager
                    FROM Employees e1
                    LEFT JOIN Employees e2 ON e1.manager_id = e2.emp_id;


        g)CROSS JOIN :is a unique join operation that returns the Cartesian product of two or more tables. 
                     -This means it matches each row from the left table with every row from the right table, resulting in a combination of all possible 
                       pairs of records.
                     -SELECT * FROM table1
                      CROSS JOIN table2;

   - Key Difference
     INNER JOIN gives/joins control over the condition (ON Customers.customer_id = Orders.customer_id).combines based on specific condition
     NATURAL JOIN automatically detects common column names (customer_id) but might cause issues if unintended columns match. combines all the rows


  **** 6.SQL COMMANDS:
        SQL commands are instructions. It is used to communicate with the database. It is also used to perform specific tasks, functions, and queries of data.      
        SQL can perform various tasks like create a table, add data to tables, drop the table, modify the table, set permission for users.
        Types Of Command:
        There are four types of SQL commands: DDL – Data Definition Language
                                              DQL – Data Query Language
                                              DML – Data Manipulation Language
                                              DCL – Data Control Language
                                              TCL – Transaction Control Language

        1}Data Definition Language:
               DDL changes the structure of the table like creating a table, deleting a table, altering a table, etc.
             - All the command of DDL are auto-committed that means it permanently save all the changes in the database.
             - (6) Create,Alter,Drop,Turnacate,Rename,Comment


             -            Command                                         Description	
                          CREATE	                Create database or its objects (table, index, function, views, store procedure, and triggers)
                                                    CREATE TABLE table_name (column1 data_type, column2 data_type, ...);


                          DROP	                Drop an existing table in a database 
                                                    Drop is uesd to delete both table and attribute
                                                    Example:
                                                    1.DROP TABLE table_name;
                                                    2.ALTER TABLE table_name
                                                      DROP COLUMN column_name;
                                                      note:remove or modify the foreign key constraint - 1.ALTER TABLE child_table DROP CONSTRAINT constraint_name;
                                                                                                           DROP TABLE parent_table;
                                                                                                         2.If you want to delete the table and automatically remove all dependencies, use CASCADE:
                                                                                                            DROP TABLE parent_table CASCADE; //This will delete the table and also remove 
                                                                                                                                                 foreign key constraints from child tables.

                          ALTER	               The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
                                                   -ALTER TABLE table_name                   ->       ALTER TABLE Persons    ->      ALTER TABLE Persons
                                                    ADD COLUMN column_name data_type;                 ADD DateOfBirth date;          ALTER COLUMN DateOfBirth year;
                                                   -ALTER TABLE Customers
                                                    DROP COLUMN Email;
                                                   -ALTER TABLE table_name
                                                    RENAME COLUMN old_name to new_name;



                         TRUNCATE	                The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.	
                                                    TRUNCATE TABLE table_name;
                         COMMENT	                Add comments to the data dictionary	
                                                    COMMENT 'comment_text' ON TABLE table_name;
                         RENAME	                Rename an object existing in the database	
                                                    RENAME TABLE old_table_name TO new_table_name;   

           @diffference between delete/drop and truncate

                     Scenario	                                    DELETE Works?	                                    TRUNCATE Works?
                     Parent Table (Referenced by another table)	✅ Works if ON DELETE CASCADE, ❌ Fails otherwise	❌ Fails unless constraints are removed
                     Child Table (References another table)	            ✅ Works	                                                ✅ Works
                     Fastest way to remove all rows?	            ❌ No	                                                ✅ Yes
                note:TRUNCATE TABLE departments CASCADE;   //(But this may delete child table data too!)
                              
           @Difference Between TRUNCATE,DELETE and DROP

                                                  Command	  Removes Data?	Removes Table Structure        Resets Auto-Increment?	Frees Space?
                                                  DELETE	  ✅ Yes (row-by-row)	❌ No	                   ❌ No	             ❌ No (slower)
                                                  TRUNCATE	  ✅ Yes (all at once)	❌ No	                   ✅ Yes	             ✅ Yes (more efficient)
                                                  DROP	  ✅ Yes	            ✅ Yes (completely             ✅ Yes	             ✅ Yes
             //Removes Table Structure:  When you TRUNCATE a table, it removes all the data (rows) inside the table, but the table itself (structure) remains intact

 2}Data Query Language(DQL) 
        -DQL statements are used for performing queries on the data within schema objects.Used To query and retrieve data from a database
        -DQL is mostly centered around the SELECT statement, which is used to fetch data according to specified criteria.
        -SELECT: select retrieves data from one or more tables.
                 SELECT column1, column2, ... FROM table_name;
        -SELECT *                     SELECT *          
         INTO newtable      ->        INTO CustomersGermany
         FROM oldtable                WHERE Country = 'Germany';
         WHERE condition;

        -Here’s an overview of the SELECT statement and its common clauses such as WHERE Clause,JOIN Clauses,GROUP BY Clauses,ORDER BY clauses

3} Data Manipulation Language(DML)
    used to retrieve, insert, update, and delete data in a database
    1.INSERT :The INSERT INTO statement is used to insert new records in a table
      -It is possible to write the INSERT INTO statement in two ways:
        1. Specify both the column names and the values to be inserted:

             INSERT INTO table_name (column1, column2, column3, ...)
             VALUES (value1, value2, value3, ...);

        2. If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query. However, 
           make sure the order of the values is in the same order as the columns in the table. Here, the INSERT INTO syntax would be as follows:

            INSERT INTO table_name
            VALUES (value1, value2, value3, ...);
   2.UPDATE :It is used to modify the existing records in a table. [US]
          UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;

   3.DELETE :It is used to delete existing records in a table.
   4.SELECT 


 4}Data Control Language(DCl): DCL commands are used to grant rights, permissions, and other controls of the database system and take back authority from any database user. 
   1.GRANT :The GRANT command is used to grant specific privileges to database users or roles
     GRANT <obj_priv> ON <obj_name> To <username>;  
     -Example: GRANT SELECT, INSERT ON Employees TO HR_Manager;
     -In the above syntax, obj_priv> is the DML statement like Insert, Delete , update and Select and <obj_name>is a table, view etc. and username 
      is the name of the authorized user
    2.REVOKE: It is used to take back permissions from the user.
     -REVOKE <obj_priv> ON <obj_name> FROM <username>;  
     -In the above syntax, obj_priv> is the DML statement like Insert, Delete , update and Select and <obj_name> is a table, view etc. and username 
      is the name of the user from whom the permission is revoked
     -Example :REVOKE DELETE ON Customers FROM Sales_Team;

5}Transaction Control Language(TCL):
Transactions are atomic i.e. either every statement succeeds or none of statement succeeds. There are number of Transaction Control statements available 
that allow us to control this behavior.These statements ensure data consistency. TCL commands can only use with DML commands like INSERT, DELETE and UPDATE only
  1.BEGIN : it is used to behin the transcation
  2.COMMIT :Changes made in the transaction saved permanently.
  3.SAVEPOINT: It is used to roll the transaction back to a certain point without rolling back the entire transaction
  4.ROLLBACK :Rollback command is used to undo transactions that have not already been saved to the database.


   SQL Command	Code Snippet	             Output
    BEGIN               BEGIN;                                     BEGIN TRANSACTION [transaction_name];
    COMMIT	            BEGIN; 
                        -- SQL statements
                        COMMIT;	                               Changes made in the transaction saved permanently.
    ROLLBACK            BEGIN; 
                         -- SQL statements 
                        ROLLBACK;	                               Changes made in the transaction rolled back.
   SAVEPOINT	  BEGIN; 
                           -- SQL statements 
                          SAVEPOINT my_savepoint;
                          -- More SQL statements 
                          ROLLBACK TO my_savepoint;	         Savepoint created and later used to roll back to a specific point in the transaction.

   ROLLBACK example:     START TRANSACTION;
                         UPDATE employees SET dept_id = 2 WHERE emp_id = 1;
                         //-- Oops! Wrong update, let's undo it    //the detials will be not seen by others as it is not commit till 
                         ROLLBACK;

NOTE :  Category Full Form	            Purpose	                                    Common Commands
        DDL	Data Definition Language	To define and modify database structure	CREATE, ALTER, DROP, TRUNCATE, RENAME
        DML	Data Manipulation Language	To manipulate data within existing structures	SELECT, INSERT, UPDATE, DELETE
        DCL	Data Control Language	            To control access to data in the database	GRANT, REVOKE
        TCL	Transaction Control Language	To manage transactions in the database	COMMIT, ROLLBACK, SAVEPOINT, SET TRANSACTION
        DQL	Data Query Language	            To query and retrieve data from a database	SELECT (often used with WHERE, JOIN, GROUP BY, HAVING, ORDER BY)

      















