USE [HotelliReservNadvornoi]
GO
/****** Object:  StoredProcedure [dbo].[asenaGuest]    Script Date: 16.04.2024 12:26:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[asenaGuest]
@uuename varchar(80),
@uuelast_name varchar(80),
@asenaId int
as
begin 
select * from guest;
update guest
set first_name = @uuename,
last_name=@uuelast_name
where @asenaId=id;
select * from guest;
end