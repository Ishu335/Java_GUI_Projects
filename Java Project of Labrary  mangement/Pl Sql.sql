-- Assignment 4
-- use exam;
-- create table borrower(roll_in int primary key ,name varchar(20),data_of_issue date,name_of_book  varchar(20),status varchar(20));
-- insert into borrower value(1,'A','2002/02/1','C','Issue');
-- insert into borrower value(2,'B','2023/12/1','C++','Issue');
-- insert into borrower value(3,'C','2012/04/12','Java','retuen');
-- insert into borrower value(4,'D','2023/10/10','Java++','Issue');
-- select * from borrower;
-- create table fine(roll_no int ,return_date date,ammount int,foreign key(roll_no) references borrower(roll_in));

delimiter $
create procedure cal_fine1(in roll int)
begin
declare no_of_days int ;
declare fine int;
declare issuedate date;
declare exit handler for sqlexception select 'create tabel definition';
select date_of_issue into issuedate from borrower where roll_in=roll;
select dateiff(curdate(),issuedate) into no_of_days;
if no_of_days>15 and no_of_days<=30 then
set fine=no_of_days*5;
insert into fine values(roll,curdate(),fine);
elseif no_of_days>30 then
set fine=no_of_days*5+10;
insert into fine values(roll,curdate(),fine);
else
insert into fine values(roll,curdate(),0);
end if;
update borrower set status ="Return" where roll_in =roll;
end$

-- create function find_result(roll_in int)returns int deterministic
-- begin
-- declare fmarks int;
-- declare grade char(10);
-- declare stud_name char(10);
-- select stud_marks.total_marks,stud_marks.name into fmarks,stud_name from stud_marks where stud_marks.roll_no=roll_in;
-- call cal_fine1(fmarks.@grade);
-- insert into result values(roll_in,stud_name,@grade);
-- return roll_in;
-- end;
-- $

-- call find_result(1);
call cal_fine1(2)$

select * from fine;