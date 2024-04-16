USE [HotelliReservNadvornoi]
GO
/****** Object:  StoredProcedure [dbo].[uueRoom_type_]    Script Date: 16.04.2024 12:11:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[uueRoom_type_]
@uue_disc varchar(80),
@uue_maxCapacity int
as
begin 
select * from room_type;
Insert into room_type(description_,max_capacity)
values(@uue_disc,@uue_maxCapacity);
select * from room_type;
end