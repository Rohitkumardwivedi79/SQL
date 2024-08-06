-- to create database 
create database college;
create database IF NOT EXISTS college;  -- if not exists then it will create database

-- to drop database
drop database rohit;
drop database if exists rohit;

-- to drop table
drop table student;
drop table if exists student;

-- to use database created by you  
use college;

-- creation of table 
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

-- another way of assigning primary key
CREATE TABLE student (
    id INT,
    name VARCHAR(50),
    age INT NOT NULL,
    PRIMARY KEY(id)
);

-- insert data or tuple into table 
INSERT INTO student VALUES(1,"Rohit",19);
INSERT INTO student VALUES(2,"Mohit",21);
-- insert multiple entries in one go
INSERT INTO student (id,name,age) VALUES (3,"ankit",18),(5,"nidhi",20),(4,"neha",24);
-- mostly we need to write above syntax when we change the order otherwise can use like this
INSERT INTO student VALUES (7,"Nandu",41);
INSERT INTO student VALUES (8,"Nandu",42);
INSERT INTO student VALUES (10,"Nandu",41),(11,"piyush",43);

--   -----------------------  distinct  -----------------------
select distinct name from student;


-- getting the data from student table 
SELECT * FROM student;
select id,name from student;
show databases;  -- show all the databases 
show tables;  -- show all the tables in the DB which you are using.

--               Diff between not null and unique
create table temp1(
	id INT UNIQUE
); 
insert into temp1 values (101);
insert into temp1 values (101);  --  will give error
insert into temp1 values (null);

--      ----------------------  Default value  -----------------------
 
CREATE TABLE emp(
	id INT,
    salary INT DEFAULT 22000
);
insert into emp (id) values (2);
select * from emp;

--  -----------------------------  Constraints & limit  -------------------------
create table emp2(
	id INT Primary key,
    age INT,
    CONSTRAINT age check (age>=18 AND age<=28),  -- add it anywhere but preferable at the last
    salary INT check (salary>=20000)
);

insert into emp2 values (3,18,20000);
select * from emp2;

--   ----------------------------------- IN, NOT IN, BETWEEN OR, AND ---------------- 
select * from emp2 where salary in (20000);
select * from emp2 where salary not in (20000,13000);
select * from emp2 where salary between 10000 and 20000;    -- inclusive range hoti h

--                 ------------    LIMIT    -----------
select * from student limit 3;  -- will give only three from top
SELECT * FROM student limit 0,10; -- 0 index se top 10 entry pick krega
select * from student where id!=2 limit 3;

--                 ------------  asc, desc  -------------
select * from student order by age asc;
select * from student order by age desc;

--                 ------------    order by    -----------
select * from student order by age desc limit 3;

--                 ------------    Aggregate Function ( min, max, count, sum, avg )   -----------
select max(age) from student;
select avg(age) from student;

--                 ------------    group by   -----------
select name from student group by name;  -- group bna dega name ke base pe
select name, count(id) from student group by name;  -- count of students of particular name

-- ❌ select name,age count(id) from student group by name;  query glt h agr hm aggeregate funnction ke phle jitne attr likh rhe h unhe hm group by me use krna hi pdega
select name,age, count(id) from student group by age,name; -- age or name dono ke base pe group by hoga


--                  order by, group by
-- ✖️ it won't run beacuse my table is different
select city, avg(marks) from student group by city order by city; -- order on the basis of city
select city, avg(marks) from student group by city order by marks; -- order on the basis of marks by default asc order
select city, avg(marks) from student group by city order by marks DESC; -- order on the basis of marks in desc order

--                        Having Clause
-- where -> is used to apply condition on rows
-- having -> is used to apply condition on groups
select count(rollno),city from student group by city having max(marks)>90;

--  💢✡️  General Order #IMPORTANT  ✡️💢
-- select column
-- from table
-- where condition on row
-- group by column
-- having condition on groups( column )
-- order by column asc
-- limit

--   whole query using all 
select city 
from student
where grade='A'
group by city
having max(marks) >=93
order by city DESC;

--                     UPDATE
select * from student;
-- set sql_safe_updates = 0;
update student set age = 47 where name='nidhi';
update student set age = age+1; -- increase the age of all

--                     DELETE
-- delete from student;  => delete all the data of table.
delete from student where name="Nandu";

--            forign key,cascade ( khud se changes ho )


--           Alter ( changes the schema )
select * from student;
-- add column
alter table student add column grade varchar(5);
-- drop column
alter table student drop column grade;
-- rename table name
alter table emp2 rename to employee;
-- change (rename) column name { can rename ,modify datatype and contraint also }
alter table student change column grade Grade varchar(10);
alter table student change grade Grade varchar(10);
-- only modify datatype/ constraint
alter table student modify Grade varchar(20);


FLUSH PRIVILEGES;


-- multiple ways to do same task
select * from student where id not in(3);
select * from student where id!=3;

-- find second max age using desc and limit
select age from student order by age desc limit 1,1;
select age from student where age!=(select max(age) from student) order by age desc limit 1;

-- find first max age 
select max(age) from student;

