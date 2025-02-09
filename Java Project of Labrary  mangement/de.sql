-- use exam;
-- select * from table3;
-- desc table3;
-- desc std;
-- select * from table1;
insert into table3 values("Dhoniae",35,"goa",90134);
select * from table3;
delimiter 
create trigger triger_name after insert on table3 for each row 
begin
insert into table1 value(table3.Name,table3.Roll,table3.City,table3.Mobil_No);
end 


