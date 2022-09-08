USE [StudentCrud]
GO
/****** Object:  StoredProcedure [dbo].[InsertData]    Script Date: 9/7/2022 10:35:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec InsertData 'zahid',5,'01/02/2022','01/02/2022'

ALTER procedure [dbo].[InsertData]
@name varchar(50),
@class int=0,
@dob datetime=0,
@clsstart datetime=0

as begin
insert into StudentDBMS(Name,Class,DOB,Class_Started) values(@name, @class,@dob,@clsstart)
end