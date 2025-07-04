-- Q1:waq to create a database by name dest_db

create schema dest_db;
use dest_db;


-- Q2: waq to create a table named as employee which has the following columns
/*
eid int nn pk ai,
name varchar(100) nn
company varchar(100) nn
salary int nn
exp in nn
*/


create table employee2(
eid int not null primary key auto_increment,
name varchar(100) not null,
company varchar(100) not null,
salary int not null,
exp int not null
);


describe employee2;


-- Q3: waq to add column dob to employee table after name

alter table employee2
add column dob date after name;

-- Q4: waq to add column phnnum into employee table

alter table employee2
add column phnnum bigint;

-- Q5: waq to add following columns to employee table
-- designation after company
-- email after phone
-- add_line after exp
-- city after add_line
-- state after city
-- country ater state
-- pincode after country

alter table employee2
add column designation varchar(100) after company,
add column email varchar(100) after phnnum,
add column add_line  varchar(100) after exp,
add column city varchar(100) after add_line,
add column state  varchar(100) after city,
add column country varchar(100) after state,
add column pincode int after country;

describe employee2;


-- Q6: waq to change the name of all columns by preciding it with emp_

alter table employee2
rename column eid to emp_id,
rename column name to emp_name,
rename column company to emp_company,
rename column dob to emp_dob,
rename column designation to emp_designation,
rename column salary to emp_salary,
rename column exp to emp_exp,
rename column add_line  to emp_add_line,
rename column city to emp_city,
rename column state to emp_state,
rename column country to emp_country,
rename column pincode to emp_pincode,
rename column phnnum to emp_phnnum,
rename column email to emp_email;

use dest_db;
describe employee2;

-- Q7 waq to change the varchar size of all columns to 300

alter table employee2
modify column emp_name varchar(300) not null,
modify column emp_company varchar(300) not null,
modify column emp_designation varchar(300) not null,
modify column emp_add_line varchar(300) not null,
modify column emp_city varchar(300) not null,
modify column emp_state varchar(300) not null,
modify column emp_country varchar(300) not null,
modify column emp_pincode varchar(300) not null;

describe employee2;

-- Q8 waq to change the datatype of the column int to varchar
alter table employee2
modify column emp_pincode varchar(50) ;

-- Q9 waq to change the datatype of the column pincode to int
alter table employee2
modify column emp_pincode int not null;

describe employee2;

-- Q10 waq to make the phnnum and email as unique
alter table employee2
modify column emp_phnnum bigint not null unique,
modify column emp_email varchar(300) not null unique;
describe employee2;

-- Q11 waq to add the default value for column country as 'India' and make the column as nullable

alter table employee2
modify column emp_country  varchar(300) not null default 'INDIA';

-- Q12 waq to remove the column add_line from empoyee1 table
alter table employee2
drop column emp_add_line;

-- Q13 waq to add the column add_line from empoyee1 table
alter table employee2
add column emp_add_line varchar(300) not null after emp_exp;
describe employee2;

-- Q14 
-- approach 1 direct
insert into employee2 values(1,'akash','1990-01-23','tcs','senior manager',125000,13,'#23 4th main','bengaluru','kar','INDIA',560312,7878595985,'akash3@tcs.in');

-- approach 2 column
insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('bimal','1993-02-20','infosys','manager',10000,10,'#2 5th main','mysuru','kar','INDIA',560312,9087656565,'bimila@info.in');


insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('ganesh','1999-03-20','wipro','junior manager',12000,14,'#2 9th main','nellore','andhra','INDIA',524004,8978277109,'ganesh@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('maha','1997-02-18','accenture','sales',21000,15,'#2 10th main','hassan','kar','INDIA',524002,9087656765,'mahi@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('sri','2000-02-20','infosys','acnts',10050,16,'#2 21th main','mysuru','kar','INDIA',560312,9087111165,'sri@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('arpitha','2002-04-19','sap','market',10250,17,'#8 21th main','mysuru','kar','INDIA',560312,9127111165,'arpitha@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('tushar','2003-12-19','sapsap','market',10230,66,'#38 21th main','hssn','kar','INDIA',560312,9127119088,'arpi1@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('smily','2001-11-12','code','market manager',11150,27,'#8 3th main','mysuru','kar','INDIA',560312,6327111177,'smily@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('yogesh','1988-10-19','sap','market',10250,17,'#8 21th main','mysuru','kar','INDIA',560312,9127111166,'yogesh@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('srikanth','2002-09-19','sap','market',10250,17,'#8 21th main','mysuru','kar','INDIA',560312,9127111155,'srikanth@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('maina','2002-08-19','sap','market',10250,17,'#8 21th main','mysuru','kar','INDIA',560312,9127111144,'maina@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('kusuma','2002-07-19','sap','market',10250,17,'#8 21th main','mysuru','kar','INDIA',560312,9127111133,'kusuma@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('kavya','2002-06-19','amazon','market',10250,17,'#8 21th main','mysuru','kar','INDIA',560312,9127111122,'kavya@info.in');

insert into employee2(emp_name ,emp_dob  ,emp_company, emp_designation ,emp_salary ,emp_exp ,emp_add_line ,emp_city ,emp_state ,emp_country,emp_pincode ,emp_phnnum,emp_email)
values('keerthana','2002-05-19','sap','market',10250,17,'#8 21th main','mysuru','kar','INDIA',560312,9127111111,'keerthana@info.in');


select * from employee2;

-- Q15 waq to view all thw details of the employee with the id=1
select * from employee2 where emp_id=1;

-- Q16 waq to view all thw details of the employee who works for tcs
select * from employee2 where emp_company='sap';
select * from employee2 where emp_company like 'sap';
select * from employee2 where emp_company like '_ap';
select * from employee2 where emp_company like 'sa%';
select * from employee2 where emp_company like 's%p';
select * from employee2 where emp_company like 's_p';

-- % 0 or any no of characters
-- _ one and only one character

-- Q17 waq to view all thw details of the employee who is not from bangalore
select * from employee2 where emp_city !='bengaluru';
select * from employee2 where emp_city <>'bangalore';
select * from employee2 where emp_city not like'bangalore';


-- Q18 waq to view all thw details of the employee who not  works for tcs
select * from employee2 where emp_company !='sap';
select * from employee2 where emp_company <>'sap';
select * from employee2 where emp_company not like'sap';

-- Q19 waq to print the names of all employees from employee1 table
select  emp_name from employee2;

-- Q20 waq to print id,name,dob and company details from employee1 table
select emp_id, emp_name,emp_company from employee2;

-- Q21 waq to print all details of employee having salary more than 50000
select * from employee2 where emp_salary>50000;

-- Q22 waq to print all details of employee having salary less than 50000
select * from employee2 where emp_salary<50000;

-- Q23 waq to print all details of employee having salary less than or equal to 50000
select * from employee2 where emp_salary<=50000;

-- logical operators
-- and , or, not

-- Q24 waq to print all details of employee  whose salarry more than 50000 and not working in sap
select * from employee2 where emp_salary>50000 and emp_company!='sap';

-- Q25 waq to print all details of employee  who stays in either kavali or kovur
select * from employee2 where emp_city='kavali' or emp_city='kovur';

-- Q26 waq to print all details of employee who  do not stays in either kavali or kovur
select * from employee2 where emp_city!='kavali' and emp_city!='kovur';
select * from employee2 where emp_city not in ('kavali','kovur');


-- Q27 waq to print all details of employee whose name starts 
  
 SELECT *
FROM employee2
WHERE emp_name like '%a' or emp_name like '%e' or emp_name like '%i' or emp_name like '%o' or emp_name like '%u' ;

-- Q28 --  starts with vowel
 select * FROM employee2
WHERE emp_name like 'a%' or emp_name like 'e%' or emp_name like 'i%' or emp_name like 'o%' or emp_name like 'u%';

-- Q29 waq to print all details of employee whose sal > 50000 and less than 150000
select * from employee2 where emp_salary>50000 and emp_salary<150000;
select * from employee2 where emp_salary between 50000 and 150000;

-- Q30 waq to print all details of employee who is born on or before 1st jan 1997
select * from employee2 where emp_dob <= '1997-01-01';

-- Q31 waq to print all details of employee who is born after 1st jan 1997 and  before 30th march 2002
select * from employee2 where emp_dob between '1997-01-01' and '2002-03-30';
select * from employee2 where emp_dob >'1997-01-01' and emp_dob <'2002-03-30';



-- only disable sql_safe_updates if u r sure wt u r doing allows update and deletes sttement without a WHERE or LIMIT clause.
-- Q32 waq to change the name of employee from kusuma to kusumak
set sql_safe_updates=false;   
update employee2 set emp_name='kusumak' where emp_name='kusuma';

-- Q33 waq to update the salary of all employees by 10%
update employee2 set emp_salary =emp_salary + (emp_salary * 0.1);
select * from employee2;

-- Q34 waq to print the details of employee who stays in mainroad
select * from employee2 where emp_add_line like '%main';

-- Q35 waq to update the city of all employee from mysuru to mysuru1
update employee2 set emp_city='mysuru1' where emp_city='mysuru';

-- Q36 waq to update the state from kar to kar1
update employee2 set emp_state='karn' where emp_state='kar';
select * from employee2;

-- Q37 waq to update the salary b y decrementing the salary by 27%for all emp working in sap
update employee1 set emp_salary=emp_salary - (emp_salary * 2.7)  where emp_company='sap';

-- aggregate functions 
/*max
min 
avg
count
sum
*/

-- Q38 waq to update the desgination of all managers to senior manager and all the senior managers to directors
update employee2 set emp_designation='senior manager' where emp_designation ='manager';

-- Q39 WAQ to delete the employee with the id10
delete from employee2 where emp_id=10;

-- Q40: waq to fetch the highest salary from the employee table
select max(emp_salary) as Max_Salary from employee2;

-- Q41: waq to fetch the lowest salary from the employee table
select min(emp_salary) as Min_Salary from employee2;

-- Q42:waq to fetch the average salary of the employee from the employee table
select avg(emp_salary) as Avg_Salary from employee2;

-- Q43:waq to count total number of the employee in the given table
select count(*) as emp_count from employee2;

-- Q44:waq to find sum of all salaries from employee1 table
select sum(emp_salary) as sum_salary from employee2;

-- Q45:waq to find details of employee with highest salary
select * from employee2 
order by emp_salary desc
limit 1;

select * from employee2
where emp_salary = (select max(emp_salary) from employee2);

-- Q46:waq to find details of employee with low salary
select * from employee2 
order by emp_salary asc
limit 1;

-- Q47:waq to find details of employee with 2nd high salary
select * from employee2
order by emp_salary desc
limit 1 offset 1;


-- q50 3rd high salary
select emp_salary from employee2 
order by emp_salary desc
limit 1 offset 2;

-- q51 3rd low salary
select emp_salary from employee2 
order by emp_salary asc
limit 1 offset 2;

-- q52 6th high salary
select emp_salary from employee2 
order by emp_salary desc
limit 1 offset 5;


-- q53 3rd high salary
select emp_salary from employee2 
order by emp_salary asc
limit 1 offset 2;

-- q54 4th high salary
select emp_salary from employee2
order by emp_salary desc
limit 1 offset 3
;

-- q55 5th low salary
select emp_salary from employee2
order by emp_salary asc
limit 1 offset 4;

-- q56 employee whose name is 5th in attandance
select * from employee2;

SELECT emp_name
FROM employee2
ORDER BY emp_name ASC
LIMIT 1 OFFSET 4;

-- q57  find employee  name who belongs to city which is second as per alphabet order

SELECT *
FROM employee2
ORDER BY emp_city ASC
LIMIT 1 OFFSET 1;


  describe employee2;
-- 	Q58 waq to display all the details of employees who are working in same designation in which akash is working or maha is working
     select * from employee2
     where emp_designation = (select emp_designation from employee2 where emp_name='akash');

-- 	Q59 waq to display name and phnnum of employees whos contact number last 3rd digit is 9
      select emp_name , emp_phnnum from employee2 
      where emp_phnnum like '%9__';
      
-- 	Q60 waq to display the details of employees who are  earning more than sri and from kar
      select * from employee2 
      where emp_salary > (select emp_salary from employee2 where emp_name='sri') and emp_city='karn';
      
-- 	Q61 waq to display the details of employees who is 2nd 3 4 5 senior most according to age
      	
      select * from employee2 
      order by emp_dob asc
      limit 4 offset 1; 

-- 	Q58 waq to view all details of employee

USE `dest_db`;
DROP procedure IF EXISTS `selectAll`;

DELIMITER $$
USE `dest_db`$$
CREATE PROCEDURE `selectAll` ()
BEGIN
 select * from employee2;
END$$

DELIMITER ;

call selectAll;




-- 	Q58 waq to create a procedure which accepts em_id as parameter and prints the employee details
USE `dest_db`;
DROP procedure IF EXISTS `selectById`;

DELIMITER $$
USE `dest_db`$$
CREATE PROCEDURE `selectById` (IN empid int)
BEGIN
select * from employee2
where emp_id=empid;
END$$

DELIMITER ;


call selectById(3);

-- 	Q60 waq to create a procedure which accepts salary as parameter and prints the employee details who has sal more than specified
USE `dest_db`;
DROP procedure IF EXISTS `salary`;

DELIMITER $$
USE `dest_db`$$
CREATE PROCEDURE `salary` (IN salary bigint)
BEGIN
  select * from employee2
  where emp_salary > salary;
END$$

DELIMITER ;
call salary(50000);


-- 	Q61 waq to create a procedure which accepts city as parameter and prints the employee details belongs to that city

USE `dest_db`;
DROP procedure IF EXISTS `getEmployeesByCity`;

DELIMITER $$
USE `dest_db`$$
CREATE PROCEDURE getEmployeesByCity(IN city_name VARCHAR(100))
BEGIN
    SELECT * FROM employee2
    WHERE emp_city = city_name;
END$$

DELIMITER ;
 call getEmployeesByCity('bengaluru');



-- 	Q62 waq to create a procedure which accepts salary as parameter along with company name and prints the employee details who has sal more than specified and works in specified company
USE `dest_db`;
DROP procedure IF EXISTS `salary_company`;

DELIMITER $$
USE `dest_db`$$
CREATE PROCEDURE salary_company(IN sal BIGINT, IN comp VARCHAR(100))
BEGIN
    SELECT * FROM employee2
    WHERE emp_salary > sal AND emp_company = comp;
END$$

DELIMITER ;
call salary_company(11000,'infosys');

-- 	Q63 waq to update the salry of employee by specified amount for the employee who is from specified city
USE `dest_db`;
DROP procedure IF EXISTS `updateSalaryByCity`;

DELIMITER $$
USE `dest_db`$$
CREATE PROCEDURE updateSalaryByCity(IN city_name VARCHAR(100), IN increment_amt BIGINT)
BEGIN
    UPDATE employee2
    SET emp_salary = emp_salary + increment_amt
    WHERE emp_city = city_name;
END$$

DELIMITER ;
CALL updateSalaryByCity('hassan', 5000);


  use dest_db;
-- Q64 WAQ to convert the given character into its repesctive ascii value  
   select ascii('s');
   select ascii('A');
   select ascii(emp_name) from employee2;
   
   -- Q65 Write a query to convert the name of employe eto uppercase
   select upper(emp_name) from employee2;

  -- Q66  Write a query  convert the name of employee  to lowercase
   select lower(emp_name) from employee2;
   
   -- Q67  write a query to count total number of charcater in the employee name
     select length(emp_name) from employee2;
   
   -- Q68 write a qey to print the name of the employee along withe reverse of the name
     select emp_name,reverse(emp_name) from employee2;
     
-- Q69 write a query to check if the names of the emloyee are palindrome or not

  set sql_safe_updates= false;
  update employee2 set emp_name = "Markram" where emp_name='akash';
  select emp_name,
  case 
   when lower(emp_name)=lower(reverse(emp_name)) then 'Palindrome'
   else 'Not Palindrome'
   end as palindrome_status
   from employee2;
   
   -- Q70 WAQ to concat the string '_comapany' for all companies in the emplyee table
   select emp_name,emp_company, concat(emp_company,'_company') from employee2;
   
   -- Q71  WAQ to find the square root of the given number
    select sqrt(25);
    select sqrt(125);

-- Q72 WAQ to print the ceiling value of given number
	select ceiling(34.567);
    select ceiling(34.117);

 -- Q73   WAQ to print the floor value of the given number
    select floor(4.567);
    select floor(34.117);
    
 -- Q74  WAQ to print the cos teta value of the given number
    select cos(70);
    select cos(180);
 
 
-- Q75  WAQ to print the sin  teta value of the given number
    select sin(90);
    select sin(180);
    
    -- Q76  WAQ to print the acos teta value of the given number
    select acos(90);
    select acos(180);
    
     -- Q77  WAQ to print the asin teta value of the given number
    select asin(0.9);
    select asin(0.80);
    
      -- Q78  WAQ to print the atan teta value of the given number
    select atan(0.43);
    select atan(0.2356);
    
-- Q79  WAQ to find the power
  select power(5,2);
   select power(18,2);
   
-- Q80 WAQ to find log2 
    select log2(34);
    select log2(12);
    
-- Q81 WAQ to find log10
    select log10(34);
    select log10(12);


-- Q82WAQ to prnt the pii value
 select pi();
 
-- Q83 WAQ to print random  
 select rand();

-- Q84 WAQ to print the square of the given number
 select square(25);  -- its not there in this version removed in the previous 


-- Q85 WAQ to print current date  and time
 select current_timestamp();
 
 -- Q86 WAQ to print current date  
 select date(current_timestamp());
 
 -- Q87 WAQ to print the date from the dob of the employee
 select day(emp_dob) from employee2;
 
  -- Q88 WAQ to print the day name  of the dob of the employee
 select dayname(emp_dob) from employee2;

  -- Q89 WAQ to print the month of the dob of the employee
 select month(emp_dob) from employee2;


  -- Q90 WAQ to print the month name of the dob of the employee
 select monthname(emp_dob) from employee2;
 
 
  -- Q91 WAQ to print the year  of the birth of the  employee
 select year(emp_dob) from employee2;
 
 
  -- Q92 WAQ to print the week number in which the employee is born 
 select yearweek(emp_dob) from employee2;
 
   -- Q93 WAQ to print the current system date and time
 select sysdate();
 select now();
 
   -- Q94 WAQ to print the current user of the system
    select system_user();
    
-- Q95 WAQ to create department table and insert values
create table department2(
dept_id int not null primary key,
dept_name varchar(40),
emp_id int,
FOREIGN KEY (emp_id)
REFERENCES employee2(emp_id)
ON DELETE SET NULL
ON UPDATE CASCADE);

INSERT INTO department2 (dept_id, dept_name, emp_id) VALUES
(10, 'Manager', 1),
(20, 'Manager', 2),
(30, 'Manager', 3),
(40, 'saleing', 4),
(50, 'Accounts', 5);

select * from department2;

-->ON DELETE SET NULL → If the employee is deleted, the emp_id in department becomes NULL.
   ON UPDATE CASCADE → If emp_id changes in employee2, it gets updated here too.



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
create table Student(
sid int,
sname varchar(10),
sem1 decimal(4,2),
sem2 decimal(4,2),
sem3 decimal(4,2),
sem4 decimal(4,2),
arg decimal(4,2));

delimiter ??
create trigger std_aggr
before d


insert into Students values(101,'kavya',92.22,88.3,66.11

create table employee(
empid int,
emp_name varchar(10),
emp_age int,
emp_adress varchar(20),
emp_depid int);

insert into employee values(1,'akash',22,'bangalore karnataka',999);
insert into employee values(2,'anajli',22,'mysore karnataka',888);
insert into employee values(3,'deepa',22,'hassan karnataka',111);


create table employee_log(
epid int,
e_name varchar(10),
e_age int,
e_adress varchar(20),
e_depid int);



-- Product table
CREATE TABLE product (
    prid INT PRIMARY KEY,
    pname VARCHAR(30),
    pavail VARCHAR(30),
    quali INT
);

-- Purchase table with foreign key reference
CREATE TABLE purchase (
    p_id INT,
    c_id INT,
    cname VARCHAR(30),
    prid INT,
    pname VARCHAR(30),
    quality INT,
    FOREIGN KEY (prid) REFERENCES product(prid)
);

INSERT INTO product (prid, pname, pavail, quali) VALUES
(101, 'Laptop', 'Yes', 10),
(102, 'Smartphone', 'No', 0),
(103, 'Headphones', 'Yes', 25),
(104, 'Keyboard', 'Yes', 15);


INSERT INTO purchase (p_id, c_id, cname, prid, pname, quality) VALUES
(1, 201, 'Alice', 101, 'Laptop', 1),
(2, 202, 'Bob', 103, 'Headphones', 2),
(3, 203, 'Charlie', 104, 'Keyboard', 1),
(4, 204, 'Diana', 101, 'Laptop', 1);



DELIMITER $$
USE `dest_db`$$
CREATE PROCEDURE `selectName` ()
BEGIN
 select name from employee2
 where emp_name='yogesh';
END$$

DELIMITER ;

call selectALL1(1);



USE `dest_db`;
DROP procedure IF EXISTS `new_procedure`;

DELIMITER $$
USE `dest_db`$$
CREATE PROCEDURE `new_procedure` ()
BEGIN
   select * from employee2
   where emp_id=emp_id;
END$$

DELIMITER ;

call new_procedure(3);
