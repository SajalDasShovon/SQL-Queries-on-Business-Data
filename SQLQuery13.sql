--exec [dbo].[DeleteData] 5,'Sajal',10,'01/02/2022','01/09/2022'

ALTER procedure [dbo].[DeleteData]
@roll int,
@name varchar(50), 
@class int=0,
@dob datetime=0,
@clsstart datetime=0

as begin
delete from StudentDBMS where Roll=@roll;
end