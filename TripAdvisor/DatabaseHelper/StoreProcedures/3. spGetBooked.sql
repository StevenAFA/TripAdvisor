
CREATE PROCEDURE spGetBooked
	@email VARCHAR(50)
AS
BEGIN
	SELECT 
		bookedId,
		checkin,
		checkout,
		adults,
		bookedHour,
		total,
		created
	FROM [TripAdvisor].[dbo].[Booked]
	WHERE email = @email
END
GO
