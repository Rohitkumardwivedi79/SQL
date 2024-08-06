--                Inner Join ( common data )
create table stud(
	id INT PRIMARY KEY,
    name varchar(20)
);

create table course(
	id INT PRIMARY KEY,
    course varchar(50)
);

Insert into stud (id,name) values (101,"A"),(102,"B"),(103,"C");
Insert into course (id,course) values (102,"English"),(103,"Hindi"),(104,"Physics"),(105,"Computer Science");

select * from stud;
select * from course;

select * from stud inner join course on stud.id=course.id;

--      alias -> alternate name 
select * from stud as s inner join course as c on s.id=c.id;

--                      Left Join ( left ka poora or usse matching ka right se waki null)
select * from stud left join course on stud.id=course.id;

--                      Right Join ( right ka poora or usse matching ka left se waki null)
select * from stud right join course on stud.id=course.id;

--                      Full Join ( left join UNION right join )
select * from stud left join course on stud.id=course.id UNION select * from stud right join course on stud.id=course.id;

--                      Left Exclusive Join ( left ke jo right wale me nh h )
select * from stud left join course on stud.id=course.id where course.id is NULL;

--                      Right Exclusive Join ( right ke jo left wale me nh h )
select * from stud right join course on stud.id=course.id where stud.id is NULL;

--                      Self Join ( khud ki hi table se join )



--                      UNION (same no. of column,column must have similar data types, column in same order)
select name from stud union select name from stud;

--                      UNION ALL ( duplicate bhi de deta h )
select name from stud union all select name from stud;



--                    SubQueries
select * from student;
select avg(age) from student;
select name ,age from student where (select avg(age) from student);

--                    View ( give limited data access by view make virtual table of only relevant data )
--  iske changes original table me nh reflect hoge ye view alg virtual table ki trh act krta h
create view view1 as select name,age from student;
select * from view1;

drop view view1;
