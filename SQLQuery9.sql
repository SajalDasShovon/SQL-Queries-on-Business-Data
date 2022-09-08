--exec updateData 7,'Sajal',10,'01/02/2022','01/09/2022'

alter procedure updateData
@roll int,
@name varchar(50),
@class int=0,
@dob datetime=0,
@clsstart datetime=0

as begin
update StudentDBMS set Name=@name, Class= @class,DOB= @dob,Class_Started=@clsstart where Roll=@roll
end