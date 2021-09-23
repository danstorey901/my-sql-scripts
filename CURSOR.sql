--Select * from Student
CREATE OR ALTER PROCEDURE StudentGpaAdjustment
AS
BEGIN
	DECLARE @Firstname varchar(30);  -- use seperate declare statements for all your variables
	DECLARE @Lastname varchar(30);
	DECLARE @GpaDelta decimal(5,2);
	DECLARE cur CURSOR For
		SELECT Firstname, Lastname, GpaDelta
			From Adjustments
			Where Completed = 0;
	Open cur;   -- dont forget to close or deallocate your cursor!

	FETCH Next From cur into @Firstname, @Lastname, @GpaDelta;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE Student SET
			GPA = GPA + @GpaDelta
			WHERE Firstname = @Firstname AND Lastname = @Lastname
		

	--	SELECT Firstname, Lastname, GPA, @GpaDelta Delta, (gpa + @GpaDelta) 'New GPA'
		--	from Student
			--	Where Firstname = @Firstname and Lastname = @Lastname;

		FETCH Next From cur into @Firstname, @Lastname, @GpaDelta;
	END

	Close cur;
	Deallocate cur;


	UPDATE Adjustments SET
		Completed = 1
		Where Completed = 0;

END
GO
EXEC StudentGpaAdjustment;
GO

Select * from Adjustments;