
                               /* Data Acquisition and Manipulation using SQL */
                                        -- Course-End Project 1 --
									-- Employee Performance Mapping --
-- Action --
/* 1. Create a database named employee, then import data_science_team.csv proj_table.csv and 
emp_record_table.csv into the employee database from the given resources.*/

drop database if exists employee;
create database if not exists employee;
show databases; 

/* 2. Create an ER diagram for the given employee database. */
use employee;

create table if not exists employee.data_science_team (
EMP_ID varchar(10) Primary key
,FIRST_NAME varchar(50)
,LAST_NAME varchar(50)
,GENDER char(1)
,ROLE varchar(50)
,DEPT varchar(50)
,EXP int 
,COUNTRY varchar(50) 
,CONTINENT varchar(50));

create table if not exists employee.proj_table (
PROJECT_ID varchar(10) primary key 
,PROJ_NAME varchar(100)
,DOMAIN varchar(50)
,START_DATE date 
,CLOSURE_DATE date
,DEV_QTR varchar(10)
,STATUS varchar(10));

create table if not exists employee.emp_record_table(
EMP_ID varchar(20) 
,FIRST_NAME  varchar(10)  
,LAST_NAME  varchar(10) 
,GENDER  char(1) 
,ROLE  varchar(50)  
,DEPT  varchar(50)  
,EXP int 
,COUNTRY  varchar(50) 
,CONTINENT  varchar(50)  
,SALARY decimal (10,2)
,EMP_RATING int 
,MANAGER_ID  varchar(10) NOT NULL 
,PROJ_ID  varchar(10) 
,primary key (EMP_ID, PROJ_ID)
,foreign key (EMP_ID) references data_science_team (EMP_ID)
,foreign key (MANAGER_ID) references data_science_team (EMP_ID)
,foreign key (PROJ_ID) references proj_table (PROJECT_ID)
);

/* 3. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees 
and details of their department.*/

insert into employee.data_science_team (EMP_ID,FIRST_NAME,LAST_NAME ,GENDER,ROLE,DEPT,EXP,COUNTRY ,CONTINENT)
values ('E001','Arthur','Black','M','PRESIDENT','ALL',20,'USA','NORTH AMERICA') 
,('E005','Eric','Hoffman','M'	,'LEAD DATA SCIENTIST','FINANCE',11,'USA','NORTH AMERICA')
, ('E010',	'William','Butler',	'M','LEAD DATA SCIENTIST','AUTOMOTIVE',12,'FRANCE','EUROPE')
,('E052','Dianna','Wilson','F','SENIOR DATA SCIENTIST',	'HEALTHCARE',6,	'CANADA','NORTH AMERICA')
,('E057','Dorothy',	'Wilson','F','SENIOR DATA SCIENTIST','HEALTHCARE','9','USA','NORTH AMERICA')
,('E204','Karene','Nowak','F','SENIOR DATA SCIENTIST','AUTOMOTIVE',	8,'GERMANY','EUROPE')
,('E245','Nian','Zhen',	'M','SENIOR DATA SCIENTIST','RETAIL',6,	'CHINA','ASIA')
,('E260','Roy',	'Collins','M',	'SENIOR DATA SCIENTIST','RETAIL',7,	'INDIA','ASIA')
,('E403','Steve','Hoffman',	'M','ASSOCIATE DATA SCIENTIST',	'FINANCE',4,'USA','NORTH AMERICA')
,('E478','David','Smith','M','ASSOCIATE DATA SCIENTIST','RETAIL',3,'COLOMBIA','SOUTH AMERICA')
,('E505','Chad','Wilson','M','ASSOCIATE DATA SCIENTIST','HEALTHCARE',5,	'CANADA','NORTH AMERICA')
,('E532','Claire','Brennan'	,'F','ASSOCIATE DATA SCIENTIST'	,'AUTOMOTIVE',3,'GERMANY','EUROPE')
,('E620','Katrina',	'Allen','F','JUNIOR DATA SCIENTIST','RETAIL',2,	'INDIA','ASIA')
,('E640','Jenifer',	'Jhones','F','JUNIOR DATA SCIENTIST','RETAIL',1,'COLOMBIA',	'SOUTH AMERICA')
,('E083','Patrick',	'Voltz','M','MANAGER', 'HEALTHCARE',15,	'USA','NORTH AMERICA')
,('E103','Emily','Grove','F','MANAGER',	'FINANCE',14,'CANADA',	'NORTH AMERICA')
,('E428','Pete','Allen','M','MANAGER',	'AUTOMOTIVE',14,'GERMANY','EUROPE')
,('E583','Janet','Hale','F','MANAGER','RETAIL',	14,	'COLOMBIA',	'SOUTH AMERICA')
,('E612','Tracy','Norris','F','MANAGER','RETAIL',13,'INDIA','ASIA');

insert into employee.proj_table (PROJECT_ID ,PROJ_NAME ,DOMAIN ,START_DATE  ,CLOSURE_DATE ,DEV_QTR ,STATUS )
values ('P103','Drug Discovery','HEALTHCARE','2021-04-06', '2021-06-20','Q1','DONE')
,('P105','Fraud Detection',	'FINANCE','2021-04-11','2021-6-25',	'Q1','DONE')
,('P109','Market Basket Analysis','RETAIL','2021-04-12','2021-6-30','Q1','DELAYED')
,('P204','Supply Chain Management',	'AUTOMOTIVE','2021-07-15','2021-9-28','Q2',	'WIP')
,('P302','Early Detection of Lung Cancer','HEALTHCARE','2021-10-08','2021-12-18','Q3','YTS')
,('P406','Customer Sentiment Analysis','RETAIL','2021-07-09','2021-09-24','Q2','WIP');

insert into  employee.emp_record_table(EMP_ID ,FIRST_NAME ,LAST_NAME,GENDER ,ROLE ,DEPT ,EXP,COUNTRY,CONTINENT,SALARY,EMP_RATING ,MANAGER_ID,PROJ_ID) 
values ('E001','Arthur','Black','M','PRESIDENT','ALL',20,'USA','NORTH AMERICA',16500,5,	'NULL',	'NULL')
,('E005','Eric','Hoffman','M','LEAD DATA SCIENTIST','FINANCE',11,'USA',	'NORTH AMERICA',8500,3,	'E103',	'P105')
,('E010','William',	'Butler','M','LEAD DATA SCIENTIST',	'AUTOMOTIVE',12,'FRANCE','EUROPE',9000,2,	'E428','P204')
,('E052','Dianna','Wilson','F','SENIOR DATA SCIENTIST','HEALTHCARE',6,'CANADA','NORTH AMERICA',5500,5,'E083','P103')
,('E057','Dorothy',	'Wilson','F','SENIOR DATA SCIENTIST','HEALTHCARE',9,'USA','NORTH AMERICA',7700,	1,	'E083',	'P302')
,('E083','Patrick',	'Voltz','M','MANAGER', 'HEALTHCARE',15,	'USA','NORTH AMERICA',9500,5,'E001','NULL')
,('E103','Emily','Grove','F','MANAGER',	'FINANCE',14,'CANADA',	'NORTH AMERICA',10500,4,'E001',	'NULL')
,('E204','Karene','Nowak','F','SENIOR DATA SCIENTIST','AUTOMOTIVE',8,'GERMANY','EUROPE',7500,5,'E428','P204')
,('E245','Nian','Zhen',	'M','SENIOR DATA SCIENTIST','RETAIL',6,	'CHINA','ASIA',	6500,2,	'E583',	'P109')
,('E260','Roy',	'Collins','M','SENIOR DATA SCIENTIST','RETAIL',7,'INDIA','ASIA',7000,3,	'E583',	'NA')
,('E403','Steve','Hoffman',	'M','ASSOCIATE DATA SCIENTIST',	'FINANCE',4,'USA','NORTH AMERICA',5000,3,'E103','P105')
,('E428','Pete','Allen','M','MANAGER',	'AUTOMOTIVE',14,'GERMANY','EUROPE',	11000,4,'E001',	'NULL')
,('E478','David','Smith','M','ASSOCIATE DATA SCIENTIST','RETAIL',3,	'COLOMBIA',	'SOUTH AMERICA',4000,4,	'E583',	'P109')
,('E505','Chad','Wilson','M','ASSOCIATE DATA SCIENTIST','HEALTHCARE',5,	'CANADA','NORTH AMERICA',5000,2,'E083',	'P103')
,('E532','Claire','Brennan','F','ASSOCIATE DATA SCIENTIST',	'AUTOMOTIVE',3,	'GERMANY','EUROPE',	4300,1,	'E428',	'P204')
,('E583','Janet','Hale','F','MANAGER','RETAIL',	14,	'COLOMBIA',	'SOUTH AMERICA',10000,2,'E001','NULL')
,('E612','Tracy','Norris','F','MANAGER','RETAIL',13,'INDIA','ASIA',	8500,4,	'E001',	'NULL')
,('E620','Katrina',	'Allen','F','JUNIOR DATA SCIENTIST','RETAIL',2,	'INDIA','ASIA',3000,1,'E612','P406')
,('E640','Jenifer','Jhones','F','JUNIOR DATA SCIENTIST','RETAIL',1,	'COLOMBIA',	'SOUTH AMERICA',2800,4,	'E612',	'P406');
-- DEbugging and testing queries (used during development)
-- set FOREIGN_KEY_CHECKS = 0;
-- set FOREIGN_KEY_CHECKS = 1;
-- truncate table employee.emp_record_table;
-- alter table employee.emp_record_table modify MANAGER_ID varchar (10) NULL;
/* 3. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees 
and details of their department.*/
select
 EMP_ID
,FIRST_NAME
,LAST_NAME
,GENDER
,DEPT as "Department"
from employee.emp_record_table
order by Department , FIRST_NAME;

/* 4.Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is:  
● less than two ● greater than four  ● between two and four   */
 select
  EMP_ID
,FIRST_NAME
,LAST_NAME
,GENDER
,DEPT as "Department"
,EMP_RATING
from employee.emp_record_table
where
     EMP_RATING < 2
  or EMP_RATING > 4
  or EMP_RATING between 2 and 4
order by
     EMP_RATING;
     
/*5. Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give 
the resultant column alias as NAME. */     
select
 concat(FIRST_NAME, ' ', LAST_NAME) as "Name"
,DEPT as "Department"
from employee.emp_record_table
where 
     DEPT = 'Finance'; 
     
/*  6. Write a SQL query to retrieve the employee ID, first name, role, and department of employees who hold leadership positions (Manager, 
President, or CEO).*/     
 select
  EMP_ID
 ,FIRST_NAME
 , ROLE
 ,DEPT as "Department"
 from employee.emp_record_table
 where 
      ROLE in ('MANAGER' , 'PRESIDENT' , 'CEO');
      
/*7. Write a query to list all the employees from the healthcare and finance departments using the union. Take data from the employee record table.*/
 select
  EMP_ID
 ,FIRST_NAME
 ,LAST_NAME
 ,DEPT as "Department"
 from employee.emp_record_table
 where
      DEPT = 'HEALTHCARE'
union
select
  EMP_ID
 ,FIRST_NAME
 ,LAST_NAME
 ,DEPT as "Department"
 from employee.emp_record_table
 where
      DEPT = 'FINANCE';   
      
/* 8. Write a query to list employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also 
include the respective employee rating along with the max emp rating for the department. */
select
 EMP_ID
,FIRST_NAME
,LAST_NAME
,ROLE
,DEPT as "Department"
,EMP_RATING
,MAX(EMP_RATING) over (partition by DEPT) as "Max_employee_rating"
from employee.emp_record_table
order by
		 DEPT, EMP_RATING desc;
         
/*9. Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.  */
select
   ROLE
  ,min(SALARY) as "Minimum Salary"
   ,max(SALARY) as "Maximum Salary"
 from employee.emp_record_table
Group by 
        ROLE
order by
        Role;
	
/*10. Write a query to assign ranks to each employee based on their experience. Take data from the employee record table. */
select
      EMP_ID
	 ,FIRST_NAME
     ,LAST_NAME
     ,DEPT as "Department"
     ,EXP as " Experience"
	 ,RANK() over (Order by EXP DESC) as "Experience_rank" 
from employee.emp_record_table
order by
	  Experience_rank;
      
/*11. Write a query to create a view that displays employees in various countries whose salary is more than six thousand. Take data from the employee record 
table.*/
create view High_salary_employees_more_than_six_thousand as 
select
     EMP_ID
	 ,FIRST_NAME
     ,LAST_NAME
     ,COUNTRY
     ,DEPT as "Department"
	 ,SALARY
from employee.emp_record_table
where 
     SALARY > 6000;
     
/*12. Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.*/
select
      EMP_ID
	 ,FIRST_NAME
     ,LAST_NAME
     ,DEPT as "Department"
     ,EXP as " Experience"
from (select * from  employee.emp_record_table) as Experience
where
     EXP > 10;
     
/*13. Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team matches the organization’s set standard. The standard being: For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST', For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST', For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST', For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST', For an employee with the experience of 12 to 16 years assign 'MANAGER'.*/
use employee;
DELIMITER $$
Drop function if exists check_job_profile$$
create function check_job_profile(exp int)
returns varchar(50)
deterministic 
begin 
      declare expected_role varchar (50);
if exp <= 2 then 
   set expected_role = 'JUNIOR DATA SCIENTIST';
elseif exp > 2 and exp <= 5 then 
   set expected_role = 'ASSOCIATE DATA SCIENTIST';
elseif exp > 5 and exp <= 10 then 
   set expected_role = 'SENIOR DATA SCIENTIST';
elseif exp > 10 and exp <= 12 then 
   set expected_role = 'LEAD DATA SCIENTIST';
elseif exp > 12 and exp <= 16 then 
   set expected_role = 'MANAGER';
else
   set expected_role = 'OTHER';
   end if;
   return expected_role;
end$$
DELIMITER ;

select
       EMP_ID
	  ,FIRST_NAME
      ,LAST_NAME
      ,EXP
      ,ROLE as ASSIGNED_ROLE
      ,check_job_profile(EXP) as EXPECTED_ROLE
      ,case 
            when trim(upper(ROLE)) = 
            trim(upper(check_job_profile(EXP)))
            then 'MATCHED' 
            else 'NOT MATCHED'
		end as STATUS
from employee.data_science_team
order by
      STATUS , EMP_ID ;
      
/*14. Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.*/

explain select * from employee.emp_record_table
where FIRST_NAME = 'Eric';

create index idx_first_name on 
employee.emp_record_table (FIRST_NAME);

show index from employee.emp_record_table;
select
      EMP_ID
	 ,FIRST_NAME
     ,LAST_NAME
     ,DEPT as "Department"
     ,SALARY
     ,COUNTRY
from employee.emp_record_table
where FIRST_NAME = 'Eric';

/*15. Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating). */

select
      EMP_ID
	 ,FIRST_NAME
     ,LAST_NAME
     ,SALARY
     ,EMP_RATING
     ,(0.5 * SALARY * EMP_RATING) as BONUS
from employee.emp_record_table;

/*16. Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table. */
 
 select
       CONTINENT
      ,COUNTRY
      ,AVG(SALARY) as AVG_SALARY
from employee.emp_record_table
group by
        CONTINENT , COUNTRY
order by
        CONTINENT , COUNTRY;