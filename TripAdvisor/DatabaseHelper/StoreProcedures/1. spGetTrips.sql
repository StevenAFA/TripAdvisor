USE [TripAdvisor]
GO
/****** Object:  StoredProcedure [dbo].[spGetTrips]    Script Date: 28/2/2024 20:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetTrips]
	
AS
BEGIN
	SELECT * FROM Trips
END
