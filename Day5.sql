
-- 1.Get all employee records
 SELECT * FROM Employees;

-- 2.Get names of employees from the IT department
 SELECT Name FROM Employees WHERE Department = 'IT';

-- 3.Get employees with salary greater than 55000
 SELECT * FROM Employees WHERE Salary > 55000;

-- 4.Count number of employees in each department
 SELECT Department, COUNT(*) AS EmpCount FROM Employees GROUP BY Department;

-- 5.Get maximum salary in each department
 -> SELECT Department, MAX(Salary) AS MaxSalary FROM Employees GROUP BY Department;
 -> SELECT DISTINCT Department,
       (SELECT MAX(Salary) 
        FROM Employees E2 
        WHERE E2.Department = E1.Department) AS MaxSalary
    FROM Employees E1;


-- 6.Get employee names along with their department names
  ->SELECT E.Name, D.DeptName 
    FROM Employees E
    JOIN Departments D ON E.Department = D.DeptName;

 -->Inner Join
    SELECT Employees.Name, Departments.DeptName 
    FROM Employees 
    INNER JOIN Departments 
    ON Employees.Department = Departments.DeptName;

-->Using LEFT JOIN (in case some employees don’t have valid departments):
   SELECT E.Name, D.DeptName 
   FROM Employees E
   LEFT JOIN Departments D 
   ON E.Department = D.DeptName;

-->Using subqueries(less effiecient)
   SELECT Name,
       (SELECT DeptName 
        FROM Departments D 
        WHERE D.DeptName = E.Department) AS DeptName
  FROM Employees E;


-- 7.Find employees with no valid department in the Departments table
  SELECT E.Name 
  FROM Employees E 
  LEFT JOIN Departments D ON E.Department = D.DeptName 
  WHERE D.DeptName IS NULL;

-- 8.List top 3 highest-paid employees
  SELECT * FROM Employees 
  ORDER BY Salary DESC 
  LIMIT 3;

-- 9.Get employees with salary between 50000 and 60000
  SELECT * FROM Employees 
  WHERE Salary BETWEEN 50000 AND 60000;

--- *10.List departments with more than one employee
   SELECT Department, COUNT(*) AS EmpCount 
   FROM Employees 
   GROUP BY Department 
   HAVING COUNT(*) > 1;

--- *11.Find duplicate department entries in Employees
  SELECT Department, COUNT(*) AS DeptCount 
  FROM Employees 
  GROUP BY Department 
  HAVING COUNT(*) > 1;
  If a department appears more than once, it's considered a "duplicate entry" here.

-- 12.Find employees earning more than the average salary
   SELECT * FROM Employees 
   WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- *13.Get the department with the highest total salary
   SELECT Department 
   FROM Employees 
   GROUP BY Department 
   ORDER BY SUM(Salary) DESC 
   LIMIT 1;

-- *14.Find the highest-paid employee in each department
   SELECT * 
   FROM Employees E1 
   WHERE Salary = (
    SELECT MAX(Salary) 
    FROM Employees E2 
    WHERE E1.Department = E2.Department
   );
  (subquery gives max salary)

-- 15.Find employees who earn the highest salary overall
     SELECT * FROM Employees 
     WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- 16.Rank employees by salary within departments
   SELECT Name, Department, Salary, 
   RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS SalaryRank 
   FROM Employees;

-- 17.Show cumulative salary by department
  SELECT Name, Department, Salary, 
  SUM(Salary) OVER (PARTITION BY Department ORDER BY Salary) AS CumSalary 
  FROM Employees;

-- 18.Get departments listed in Employees but not in Departments
   SELECT DISTINCT Department 
   FROM Employees 
   WHERE Department NOT IN (
    SELECT DeptName FROM Departments
   );

-- 19.Get employees whose names start with 'A'
  SELECT * FROM Employees 
  WHERE Name LIKE 'A%';

-- 20.Format salary with a currency symbol (MySQL)
  SELECT Name, CONCAT('₹', FORMAT(Salary, 2)) AS Salary 
  FROM Employees;

-- 21.Find the second highest salary
  SELECT MAX(Salary) 
  FROM Employees 
  WHERE Salary < (SELECT MAX(Salary) FROM Employees);

  select * from employee
  order by salary DESC
  limit 2 offset 1;

 -- 22.Get the average salary of all employees
   SELECT AVG(Salary) AS AvgSalary FROM Employees;

-- 23.Order employees by department and then salary descending
  SELECT * FROM Employees 
  ORDER BY Department, Salary DESC;

-- 24.List all unique departments across Employees and Departments
   SELECT Department FROM Employees 
   UNION 
   SELECT DeptName FROM Departments;

-- 25.List departments where no employee works
   SELECT DeptName 
   FROM Departments 
   WHERE DeptName NOT IN (
   SELECT DISTINCT Department FROM Employees
    );

-- 26. 3rd high salary / n high salary
    select emp_salary from employee2 
    order by emp_salary desc
    limit 1 offset 2;    (offset like similar to remove)  Offset (n-1) for nth highest salary 

-- 27. Delete duplicate rows while keeping one record  
    DELETE FROM Employee WHERE id NOT IN ( SELECT MIN(id) FROM Employee GROUP BY name, salary, department ); 

   -- GROUP BY name, salary, department: Groups all rows that have the same name, salary, and department — essentially identifying duplicates.
      SELECT MIN(id): From each group, selects the row with the smallest id (you can change to MAX(id) if preferred).
      id NOT IN (...): Deletes all rows not in the list, i.e., all duplicates except the one with the minimum ID.
   
-- 28. Write a query to fetch all employees who have the same salary as another employee 
    SELECT e1.* FROM Employee e1 JOIN Employee e2 ON e1.salary = e2.salary AND e1.id <> e2.id; 
       
            -- SELECT * -> It will return all columns from both tables,
   
   SELECT * 
   FROM Employee 
   WHERE salary IN (
    SELECT salary 
    FROM Employee 
    GROUP BY salary 
    HAVING COUNT(*) > 1
    );
   inner query finds all salaries that are shared by more than one employee.WHERE salary IN (50000, 60000);

   🔸 GROUP BY salary → groups all rows that have the same salary.
   🔸 COUNT(*) > 1 → keeps only those salary groups that appear more than once.

-- 29.Find employees who joined in the last 3 months 
   SELECT * FROM Employee WHERE joining_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);



   
  








-->Only disable sql_safe_updates if u r sure wt u r doing allows update and deletes sttement without a WHERE or LIMIT clause.
-->WINDOW FUNCTION IN MYSQL and ITS TYPES
   window functions applies aggregate,ranking and analytic functions over a particular window(set of rows).
   And OVER clause is used with window functions to define that window (set of rows).
  -a window function performs a calculation across a set of rows that are somehow related to the current row. 
  -Unlike GROUP BY, it doesn’t collapse the rows — it retains individual rows and just adds extra info.

   Example: aggreate function: select DepID,sum(salary) 
                               from employee
                               group by DepId;
            window function :  select DepID,sum(salary)
                               OVER (Partition by DepID)
                               from employee;
    1. ROW_NUMBER()
       Purpose: Assigns a unique number to each row in the result set based on ordering.  
           SELECT name, department, salary,
           ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num
           FROM employees;  
                    | name  | department | salary | row\_num |
                    | ----- | ---------- | ------ | -------- |
                    | Dave  | HR         | 45000  | 1        |
                    | Alice | HR         | 40000  | 2        |
                    | Carol | IT         | 70000  | 1        |
                    | Bob   | IT         | 60000  | 2        |
                    | Eve   | IT         | 55000  | 3        |
                    | Grace | Sales      | 65000  | 1        |
                    | Frank | Sales      | 50000  | 2        |
 
   
       Within each department, employees are ranked by salary (highest to lowest).
       Always assigns a unique number (no duplicates).

   2.RANK()
     Purpose: Similar to ROW_NUMBER(), but assigns same rank to ties, with gaps in numbering
       SELECT name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
       FROM employees;
        | name  | dept | salary | rank |
        | ----- | ---- | ------ | ---- |
        | Dave  | HR   | 45000  | 1    |
        | Alice | HR   | 40000  | 2    |
        | Carol | IT   | 70000  | 1    |
        | Bob   | IT   | 60000  | 2    |
        | Eve   | IT   | 55000  | 3    |
      If Bob and Eve had same salary, they'd both get rank 2, and next person would get rank 4
     If two employees in a department have the same salary, they get the same rank.
     The next rank will skip numbers.

   3. DENSE_RANK()
     Purpose: Like RANK(), but no gaps in the rank numbers for ties.


                    | name  | dept | salary | d\_rank |
                    | ----- | ---- | ------ | ------- |
                    | Dave  | HR   | 45000  | 1       |
                    | Alice | HR   | 40000  | 2       |
                    | Carol | IT   | 70000  | 1       |
                    | Bob   | IT   | 60000  | 2       |
                    | Eve   | IT   | 55000  | 3       |
                 If two people tie, next person gets next rank without skipping.
       SELECT name, department, salary,
       DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank
       FROM employees;

              Example Ranks for            Same Salary	   Gaps
                      RANK()	              1, 1, 3        	Yes
                      DENSE_RANK()	        1, 1, 2	         No

   4. NTILE(n)  [n tile]
     Purpose: Distributes rows into n buckets as evenly as possible.

       SELECT name, salary,
       NTILE(3) OVER (ORDER BY salary DESC) AS bucket
       FROM employees;

         | name  | salary | bucket |
         | ----- | ------ | ------ |
         | Carol | 70000  | 1      |
         | Grace | 65000  | 1      |
         | Bob   | 60000  | 1      |
         | Eve   | 55000  | 2      |
         | Frank | 50000  | 2      |
         | Dave  | 45000  | 3      |
         | Alice | 40000  | 3      |


       Sorts by salary and divides into 3 groups (tiles).
       Use it for percentiles, quartiles, deciles, etc.

   5. LAG()
      Purpose: Returns value from the previous row in the result set.
             | name  | salary | prev\_salary |
             | ----- | ------ | ------------ |
             | Alice | 40000  | NULL         |
             | Dave  | 45000  | 40000        |
             | Frank | 50000  | 45000        |
             | Eve   | 55000  | 50000        |
             | Bob   | 60000  | 55000        |
             | Grace | 65000  | 60000        |
             | Carol | 70000  | 65000        |
           
       SELECT name, salary,
       LAG(salary) OVER (ORDER BY salary) AS previous_salary
       FROM employees;

       Compare a row’s value with the previous one (e.g., for trend analysis).

   6. LEAD()
      Purpose: Returns value from the next row in the result set.

             | name  | salary | next\_salary |
             | ----- | ------ | ------------ |
             | Alice | 40000  | 45000        |
             | Dave  | 45000  | 50000        |
             | Frank | 50000  | 55000        |
             | Eve   | 55000  | 60000        |
             | Bob   | 60000  | 65000        |
             | Grace | 65000  | 70000        |
             | Carol | 70000  | NULL         |


       SELECT name, salary,
       LEAD(salary) OVER (ORDER BY salary) AS next_salary
       FROM employees;

       Compare a row’s value with the next one.

   7. SUM() as a Window Function
       Purpose: Running total or total per group.

       SELECT name, department, salary,
       SUM(salary) OVER (PARTITION BY department ORDER BY salary) AS running_total
       FROM employees;
                  | name  | dept | salary | running\_total |
                  | ----- | ---- | ------ | -------------- |
                  | Alice | HR   | 40000  | 40000          |
                  | Dave  | HR   | 45000  | 85000          |
                  | Eve   | IT   | 55000  | 55000          |
                  | Bob   | IT   | 60000  | 115000         |
                  | Carol | IT   | 70000  | 185000         |




       Shows the cumulative sum up to the current row in each department.

   8. AVG() as a Window Function
      Purpose: Average over a partition.

                   | name  | dept | salary | avg\_salary |
                   | ----- | ---- | ------ | ----------- |
                   | Alice | HR   | 40000  | 42500.00    |
                   | Dave  | HR   | 45000  | 42500.00    |
                   | Eve   | IT   | 55000  | 61666.67    |
                   | Bob   | IT   | 60000  | 61666.67    |
                   | Carol | IT   | 70000  | 61666.67    |


      SELECT name, department, salary,
      AVG(salary) OVER (PARTITION BY department) AS avg_dept_salary
      FROM employees;

      Gives the average salary of the employee’s department in every row.

   9. MIN() and MAX()

                   | name  | dept | salary | min\_salary | max\_salary |
                   | ----- | ---- | ------ | ----------- | ----------- |
                   | Alice | HR   | 40000  | 40000       | 45000       |
                   | Dave  | HR   | 45000  | 40000       | 45000       |
                   | Eve   | IT   | 55000  | 55000       | 70000       |
                   | Bob   | IT   | 60000  | 55000       | 70000       |
                   | Carol | IT   | 70000  | 55000       | 70000       |


       SELECT name, department, salary,
       MIN(salary) OVER (PARTITION BY department) AS min_salary,
       MAX(salary) OVER (PARTITION BY department) AS max_salary
       FROM employees;

       Shows the min and max salary of each department alongside each row.



                                        | Function          | Use Case Example                      |
                                        | ----------------- | ------------------------------------- |
                                        | `ROW_NUMBER()`    | Unique row index                      |p
                                        | `RANK()`          | Rank with gaps for ties               |p
                                        | `DENSE_RANK()`    | Rank without gaps                     |p
                                        | `NTILE(n)`        | Split into n buckets (like quartiles) |
                                        | `LAG()`           | Previous row's value                  |
                                        | `LEAD()`          | Next row's value                      |
                                        | `SUM()`           | Running total or group total          |p
                                        | `AVG()`           | Average over partition                |p
                                        | `MIN()` / `MAX()` | Min/Max per partition                 |p






   
-->CASE statement/expression in SQL
   The CASE expression is like an if-else ladder in SQL. It lets you return different values based on conditions.
   1. SELECT emp_id, emp_name, emp_salary,
      CASE
      WHEN emp_salary >= 80000 THEN 'High'
      WHEN emp_salary >= 50000 THEN 'Medium'
      ELSE 'Low'
      END AS salary_level
      FROM employee2;
            | emp_name  | emp_salary  | salary_level  |
            | --------- | ----------- | ------------- |
            | Asha      | 90000       | High          |
            | Bimal     | 60000       | Medium        |
   
   2.SELECT emp_name, emp_salary
     FROM employee2
     ORDER BY
     CASE
     WHEN emp_salary >= 80000 THEN 1
     WHEN emp_salary >= 50000 THEN 2
     ELSE 3
     END;
            | emp_name  | emp_salary  |          
            | --------- | ----------- | 
            | Asha      | 90000       |       ← Rank 1 
            | Esha      | 80000       |       ← Rank 1 

   Asha and Esha have salaries ≥ 80000 → rank 1 → appear first
   Bimal has salary ≥ 50000 → rank 2 → appears after rank 1
   
  3.CASE in a JOIN condition
     SELECT e.emp_name, d.dept_name,
     CASE 
     WHEN e.emp_salary > 80000 THEN 'Senior Dept'
     ELSE 'Regular Dept'
     END AS dept_type
     FROM employee2 e
     JOIN department2 d ON e.emp_id = d.emp_id;

  4.CASE in an UPDATE statement
    UPDATE employee2
    SET emp_salary = emp_salary + 
    CASE 
    WHEN emp_salary > 80000 THEN 5000
    WHEN emp_salary > 50000 THEN 3000
    ELSE 1000
    END;

   5.CASE in a WHERE clause (not common, but valid)
    SELECT * FROM employee2
    WHERE 
    CASE 
    WHEN emp_name = 'Asha' THEN 1
    WHEN emp_salary > 50000 THEN 1
    ELSE 0
    END = 1;
    Selects Asha and anyone with salary > 50000.




   
-->GROUP and Order By
Sample Table: `Employees`

| ID | Name    | Department | Salary |
| -- | ------- | ---------- | ------ |
| 1  | Alice   | HR         | 40000  |
| 2  | Bob     | IT         | 60000  |
| 3  | Charlie | HR         | 50000  |
| 4  | David   | IT         | 70000  |
| 5  | Emma    | Finance    | 55000  |

️GROUP BY:
SELECT Department, COUNT(*) AS TotalEmployees
FROM Employees
GROUP BY Department;

Output:
| Department | TotalEmployees |
| ---------- | -------------- |
| HR         | 2              |
| IT         | 2              |
| Finance    | 1              |




ORDER BY:
SELECT Name, Salary
FROM Employees
ORDER BY Salary DESC;

Output:
| Name    | Salary |
| ------- | ------ |
| David   | 70000  |
| Bob     | 60000  |
| Emma    | 55000  |
| Charlie | 50000  |
| Alice   | 40000  |

 GROUP BY + ORDER BY Example – Grouping & Sorting

SELECT Department, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY Department
ORDER BY AvgSalary DESC;

Output:
| Department | AvgSalary |
| ---------- | --------- |
| IT         | 65000     |
| Finance    | 55000     |
| HR         | 45000     |


* `GROUP BY Department`: groups rows.
* `AVG(Salary)`: calculates average salary per department.
* `ORDER BY AvgSalary DESC`: sorts departments by average salary (highest first).



| Feature    | Purpose                                                      |
| ---------- | ------------------------------------------------------------ |
| `GROUP BY` | Combines rows with the same value to perform aggregation     |
| `ORDER BY` | Sorts the result (can be after grouping or without grouping) |
| Together   | First group data → then sort grouped results                 |


--> Create Index:
  - The CREATE INDEX statement is used to create indexes in tables.
  -  Why Use Indexes?
     To speed up SELECT queries
     To improve search/filter performance (e.g., in WHERE, JOIN, ORDER BY)
     Especially useful on large tables
   - When Not to Use Indexes
     On columns that are frequently updated
     On small tables (where full scan is already fast)
     On columns with many duplicate values (like gender or status)

      CREATE INDEX idx_salary 
      ON Employee2 (emp_salary);

      SHOW INDEXES FROM Employee2;
      -- Table	Non_unique	Key_name	Seq_in_index	Column_name	 Index_type
      -- Employee	1	    idx_salary	  1	             salary   	 BTREE

      CREATE UNIQUE INDEX idx_dob 
      ON Employee2(emp_dob);

      DROP INDEX idx_dob ON Employee2;
   
--> VIEW 
   Views in MySQL are indeed "virtual tables" that are used to view data from one or more tables. Views do not have their
   data but rather store data virtually, consisting of rows and columns. 
  -Why use a VIEW?
   To simplify complex queries
   To show only specific columns/rows to users (security)
   To reuse commonly used queries

   CREATE VIEW employee_department_view AS
   SELECT e.emp_id, e.emp_name, e.emp_designation,d.dept_name
   FROM employee2 e
   JOIN department2 d ON e.emp_id = d.emp_id;

   SELECT * FROM employee_department_view;

   UPDATE employee_department_view
   SET emp_salary = 95000
   WHERE emp_id = 1;
   
   DROP VIEW employee_department_view;

  





















