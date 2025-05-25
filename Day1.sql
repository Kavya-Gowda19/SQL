1.Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.
  The CITY table is described as follows:
CITY
Field        | Type          
-------------|--------------
ID          | NUMBER        
NAME        | VARCHAR2(17)  
COUNTRYCODE | VARCHAR2(3)   
DISTRICT    | VARCHAR2(20)  
POPULATION  | NUMBER

->
 Select *
 From city
 Where population > 100000 AND CountryCode = 'USA';

//note :1.space 
        2.' ' not double 
        3.* to select all the columns
        4.using caps AND OR

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
2.Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.
  The CITY table is described as follows:
->Select name
  Where populations>120000 AND CountryCode = 'USA';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
3.Query all columns (attributes) for every row in the CITY table.
  The CITY table is described as follows
-> select *
   Fro city;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4.Query all columns for a city in CITY with the ID 1661.
  The CITY table is described as follows:
-> Select *
   From city
   Where ID='1661';
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5.Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
  The CITY table is described as follows:
-> Select *
   From city
   Where COUNTRYCODE='JPN'; 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
6.Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
  The STATION table is described as follows:
      STATION

Field    | Type           
---------|---------------
ID       | NUMBER        
CITY     | VARCHAR2(21)  
STATE    | VARCHAR2(2)   
LAT_N    | NUMBER        
LONG_W   | NUMBER


-> Select DISTINCT city
   From Ststion 
   where MOD(ID,2)=0;  // here MOD to find the moduls

note :1.unique/no duplicate  the use DISTINCT
      2.MOD to find the modulus

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
7.Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
  The STATION table is described as follows:
->Select count(city)-count(DISTINCT city) as DIfference
  From station;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------















