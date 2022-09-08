

create procedure selectData
@roll int,
@name varchar(50), 
@class int=0,
@dob datetime=0,
@clsstart datetime=0

as begin
select * from StudentDBMS
end