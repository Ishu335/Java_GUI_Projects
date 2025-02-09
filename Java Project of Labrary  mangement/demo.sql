create database Exam;
use Exam;
create table student (Name varchar(20),ID integer(5),Subject varchar(20));
select * from student;
insert into student values("A",1112,"English Latin");
insert into student values("B",1113,"JAVA");
insert into student values("C",1234,"python");
insert into student values("D",1233,"C++");
alter table student add Marks integer;
select * from student;
alter table student Drop Marks;
alter table student modify ID varchar(20);
select * from student;
desc table student;
rename table student to std;
select * from std;
desc std;
truncate std;
alter table std modify ID integer;
alter table std Add Primary key(ID);
desc std;
update std  set Name="ABC" where ID="12336" and Subject="English";
insert into std values("A",1112,"English Latin");
insert into std values("B",1113,"JAVA");
insert into std values("C",1234,"python");
insert into std values("D",1233,"C++");
select * from std; 

delete from std where ID=3 and Subject='JAVA';
select * from std;

create table books (Id integer ,Books varchar(20),Author_name varchar(20),Price integer, Quantity integer);
desc books;
insert into books values(1001,"Java for dummies","Tan Ah Teck",11.11,11);
insert into books values(1002,"More Java ", "Ah Teck",22.22,22);
insert into books values(1003,"More Java dummies","Mohammad Ali",33.33,33);
insert into books values(1004,"A Cup of Java","Kumar",44.44	,44);
insert into books values(1005,"A Teaspoon of Java","Kevin Jones",55.55,55);
insert into books values(1112,"A Java","Kevin Jones",55.55,55);

select * from books;

create view std_view as select ID,Name,Subject from std;
select * from std_view;

create index Index_book on books (Id,Books);
select * from (Index_book);

use exam;
show tables;
select * from books;
select * from std;
select * from std_view;

-- Need same number of Colums-- 
select * from std union select * from books;
select ID,Name from std where ID>1233 union select Id,Books from books where Id=1001;
select ID,Name from std  union select Id,Books from books ;

select ID from std union all select Id from books;
-- select ID from std INTERSECT select Id from books;
-- select Id from std minus (select Id from books);
//////////////////////////////////////////////////////////////////////////-- 
create table table1 (Name varchar(20),Roll integer, City varchar(10),Mobil_No integer);
insert into table1 values("A",1,"pune",90123);
insert into table1 values("B",2,"goa",90134);
insert into table1 values("C",3,"Mumbai",90342);
insert into table1 values("Dhoni",4,"Nagpur",91234);
select * from table1;


create table table2 (Name varchar(20),Roll integer, City varchar(10),Mobil_No integer);
insert into table2 values("E",5,"pune",901243);
insert into table2 values("F",6,"goa",901344);
insert into table2 values("G",7,"Mumbai",903342);
insert into table2 values("A",8,"Nagpur",91234);
select * from table2;

create table table3 (Name varchar(20),Roll integer, City varchar(10),Mobil_No integer);
insert into table3 values("A",1,"pune",90123);
insert into table3 values("B",2,"goa",90134);
insert into table3 values("C",3,"Mumbai",90342);
insert into table3 values("D",4,"Nagpur",91234);
select * from table3;

select * from table1 union select * from table2;
select * from table1 union all select * from table2;
select City from table1 intersect select City from table2;
SELECT * FROM table1 MINUS (SELECT * FROM table3);

COMMIT;
-- /////////-- //////////////////////// JOINS In MYSQL////////-- ////////////////////////-- 
select table1.Name,table1.City,table1.Mobil_no from table1 left Outer join table2 on table1.Roll = table2.Roll ;
select table1.Name,table1.City,table1.Mobil_no from table1 right Outer join table2 on table1.Roll = table2.Roll ;
select table1.Name,table1.City,table1.Mobil_no from table1 join table3 on table1.Roll = table3.Roll ;
select * from table1;
select * from table2;
select table1.Roll from table1 inner join table3 on table1.Roll = table3.Roll ;
select * from table1 cross join table3  on table1.Roll = table3.Roll ;

create view view_table1 as select  Name,Roll from table1 where Roll >3;
select * from view_table1;
update view_table1 set Name="A" Where Roll=3;
select * from view_table1;
Alter view view_table1 drop Name;
commit;
alter table table1 drop name ;
select * from table1;
rollback;


-- /////////////////////////////////////////// Trigger query 
CREATE TABLE Employee  
(  
  Id INT PRIMARY KEY,  
  Name VARCHAR(45),  
  Salary INT,  
  Gender VARCHAR(12),  
  DepartmentId INT  
) ; 
INSERT INTO Employee VALUES (1,'Steffan', 82000, 'Male', 3),  
(2,'Amelie', 52000, 'Female', 2),  
(3,'Antonio', 25000, 'male', 1),  
(4,'Marco', 47000, 'Male', 2),  
(5,'Eliana', 46000, 'Female', 3)  ;

select * from table1;
create trigger trigger_demo
ON table1
before insert table1

CREATE TRIGGER trigger_name
ON table1
AFTER INSERT
[NOT FOR REPLICATION]  
AS  
{SQL_Statements}  



--//////////////////////////////Trigger
delimiter $
create trigger triger_name after insert on table1 for each row 
	begin
    insert into table3.values(new.Name,new.Roll,new.City,new.Mobil_No);
    end;
    
    
    