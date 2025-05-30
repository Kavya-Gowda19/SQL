1.Table: Products

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------+
product_id is the primary key (column with unique values) for this table.
low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
 

Write a solution to find the ids of products that are both low fat and recyclable.

Return the result table in any order.

The result format is in the following example.

 ->select product_id 
  From Products
  Where low_fats='Y' AND recyclable='Y';
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2.Table: Views

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
There is no primary key (column with unique values) for this table, the table may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.
 

Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.
->Select distinct author_id as id
  From Views
  Where author_id = viewer_id 
  Order by id;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3.Table: World

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |
+-------------+---------+
name is the primary key (column with unique values) for this table.
Each row of this table gives information about the name of a country, the continent to which it belongs, its area, the population, and its GDP value.
 

A country is big if:

it has an area of at least three million (i.e., 3000000 km2), or
it has a population of at least twenty-five million (i.e., 25000000).
Write a solution to find the name, population, and area of the big countries.

Return the result table in any order.
->Select name, population,area
  From World
  Where area >= 3000000 OR population >= 25000000;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4.Table: Views

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
There is no primary key (column with unique values) for this table, the table may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.
 

Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.
-->Select distinct author_id as id
   From Views
   Where author_id = viewer_id 
   Order by id;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5.Table: Tweets

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+
tweet_id is the primary key (column with unique values) for this table.
content consists of alphanumeric characters, '!', or ' ' and no other special characters.
This table contains all the tweets in a social media app.
 

Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

The result format is in the following example.

 ->Select tweet_id 
  From Tweets
  Where length(content)>15;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
6.Table: Employees

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains the id and the name of an employee in a company.
 

Table: EmployeeUNI

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+
(id, unique_id) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the id and the corresponding unique id of an employee in the company.
 

Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

Return the result table in any order.
->SELECT eu.unique_id, e.name
 FROM Employees e
 LEFT JOIN EmployeeUNI eu
 ON e.id = eu.id;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
note:1.ENUM :ENUM is a data type that lets you store only specific, pre-defined values in a column. These values are explicitly defined at the time of table creation 
             and cannot be changed unless the table structure is modified (alter).
             Example:CREATE TABLE products (
                     id INT PRIMARY KEY,
                     name VARCHAR(50),
                     category ENUM('Electronics', 'Clothing', 'Books', 'Furniture')
                      );

       INSERT INTO products (id, name, category) 
       VALUES (1, 'Smartphone', 'Electronics'); -- ✅ Valid

       INSERT INTO products (id, name, category) 
       VALUES (2, 'Jeans', 'Food'); -- ❌ Error (Invalid ENUM value)
       When to Use:✅ When you have a fixed set of values (e.g., days of the week, user roles).
                   ❌ Avoid if values might change often (better to use a separate table with FOREIGN KEY).

                                                    Use Case	                          ENUM	    FOREIGN KEY
                                                    Fixed values (rarely change)	      ✅ Yes	    ❌ No
                                                    Dynamic values (can change often)	 ❌ No	    ✅ Yes
                                                    Fast lookup performance	           ✅ Yes	    ❌ Slightly slower
                                                    Requires additional metadata	      ❌ No	    ✅ Yes
                                                    Avoids ALTER TABLE for changes	    ❌ No	    ✅ Yes
     If your app requires dynamic categories (e.g., user-defined categories), go with a FOREIGN KEY. If categories are static and won't change often, ENUM is fine.


     2.Order By :The ORDER BY keyword is used to sort the result-set in ascending or descending order.
                 The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.
                 SELECT * FROM Customers
                 ORDER BY Country;// default ascending
                 SELECT * FROM Customers
                 ORDER BY Country DESC;//desending
        
                      Controlling Sorting Direction:
                                                    Ascending order (default):    ORDER BY Country ASC, CustomerName ASC
                                                    Descending order:             ORDER BY Country DESC, CustomerName DESC
                                                  **Mixed order:                  ORDER BY Country ASC, CustomerName DESC


     3.length(content) used to find the length
     4. atleast means more than 
        Example area >= 3000000
     5.<> and != are same
     6.Like :The LIKE operator is used to search for a specified pattern in a column.
       There are two wildcards often used in conjunction with the LIKE operator:
         -The percent sign (%) represents zero, one, or multiple characters
         -The underscore sign (_) represents one, single character
  

                      LIKE Operator	             Description
              WHERE CustomerName LIKE 'a%'	     Finds any values that start with "a"
              WHERE CustomerName LIKE '%a'	     Finds any values that end with "a"
              WHERE CustomerName LIKE '%or%'	   Finds any values that have "or" in any position
              WHERE CustomerName LIKE '_r%'	     Finds any values that have "r" in the second position
              WHERE CustomerName LIKE 'a_%'	     Finds any values that start with "a" and are at least 2 characters in length
              WHERE CustomerName LIKE 'a__%'	   Finds any values that start with "a" and are at least 3 characters in length
              WHERE ContactName LIKE 'a%o'	     Finds any values that start with "a" and ends with "o


       Example:SELECT * FROM Customers WHERE CustomerName LIKE '_____';// 5dpace means 5 charaters
               SELECT * FROM Customers
               WHERE ContactName LIKE 'a%o';
               SELECT * FROM Customers
               WHERE CustomerName NOT LIKE 'a%';  


     7.Wildcards : Wildcards are special characters used with the LIKE operator to search for patterns in text.
       Wildcard	  Meaning	                                                           Example
       %	   Matches zero or more characters	                                    'A%' → Starts with "A"
       _	   Matches exactly one character	                                      '_B%' → Second letter is "B"(min 2 characters)
       [ ]	 Matches any single character inside the brackets (SQL Server only)	 'B[aeiou]g' → Matches "Bag", "Beg", "Big" 
       [^ ]	 Matches any character NOT inside the brackets (SQL Server only)	   'B[^aeiou]g' → Matches "Bkg", but NOT "Bag"
       \	   Escape character for special symbols	                               '10\% discount' → Searches for "10%"


    8.COUNT(),AVG(),SUM()
      The COUNT() function in SQL is used to return the number of rows that match a specific condition in a query.
      The AVG() function returns the average value of a numeric column. 
      The SUM() function returns the total sum of a numeric column. 


       SELECT COUNT(ProductID) //returns one coulumn/number
       FROM Products;
       SELECT COUNT(*) FROM Employees;  //counts the number of rows
       SELECT AVG(Price)
       FROM Products;
       SELECT SUM(Quantity)
       FROM OrderDetails;
 9.MIN() and MAX()
     The MIN() function returns the smallest value of the selected column.
     The MAX() function returns the largest value of the selected column.


     SELECT MAX(Price) AS LargestPrice
     FROM Products;

     SELECT MIN(Price) AS SmallestPrice
     FROM Products;
10.LIMIT :The LIMIT clause is used to specify the number of records to return. // limit 3 means till 3 the records will be given  
          The LIMIT clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.
   Example:SELECT * FROM Customers
           LIMIT 3 OFFSET 3;          //starts from 3rd row
           SELECT * FROM Customers
           ORDER BY Country
           LIMIT 3;
11.Delete: The DELETE statement is used to delete existing records in a table
   Example:DELETE FROM Customers;   //The following SQL statement deletes all rows in the "Customers" table, without deleting the table

12.UPDATE (US) -update Set 
   The UPDATE statement is used to modify the existing records in a table.
   Example:UPDATE Customers
           SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
           WHERE CustomerID = 1;
           UPDATE Customers     //Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!
           SET PostalCode = 00000;

13.NULL:NULL value is a field with no value
        A NULL value is different from a zero value or a field that contains spaces. A field with a NULL value is one that has been left blank during record creation!
        Always use IS NULL and IS NOT NULL to look for NULL values.(=NULL wrong)

        SELECT CustomerName, ContactName, Address
        FROM Customers
        WHERE Address IS NULL;

         SELECT CustomerName, ContactName, Address
         FROM Customers
         WHERE Address IS NOT NULL;

