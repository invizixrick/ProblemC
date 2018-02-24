
alter PROCEDURE TransferAllPetsToNewOwner
    @PreviousOwner	varchar(200), 
    @NewOwner		varchar(200),
    @ReturnMessage VARCHAR(1024) = ''  OUT

AS
BEGIN
--
--	Question i - It would generally be faster to perform these updates in a single update rather than
--		one at a time. However, with the single update, as the table grows and if there are several 
--		rows being updated there is potential for locking issues that could impact scalability...issues
--		that are minimized with the 'one-at-a-time' logic.
--
SET NOCOUNT ON;
DECLARE	@ErrorCode  int  
SELECT	@ErrorCode = @@ERROR

declare @previousOwnerId int
declare @newOwnerId int
select @previousOwnerId = id from petowners where name = @PreviousOwner
select @newOwnerId = id from petowners where name = @NewOwner

if (@previousOwnerId > 0 and @newOwnerId > 0)
begin

begin try
	begin tran
  
  	declare @id int
	DECLARE PetCursor CURSOR FOR 
		SELECT id FROM pets where petownerid = @previousOwnerId

	OPEN PetCursor 

	FETCH NEXT FROM PetCursor INTO @id

	WHILE @@FETCH_STATUS = 0
	BEGIN
--DECLARE @MessageOutput VARCHAR(100)
--SET @MessageOutput = 'inside with ' + CONVERT(char(2), @id)
		update pets set petownerid = @newOwnerId where id = @id

	
		FETCH NEXT FROM PetCursor INTO @id	
	END
	CLOSE PetCursor
	DEALLOCATE PetCursor
	  
	commit tran
	
	SELECT @ErrorCode  = 0, @ReturnMessage = 'All pets were moved'
    RETURN @ErrorCode                               
end try
begin catch
	rollback tran

    SELECT @ErrorCode = ERROR_NUMBER()
        ,@ReturnMessage = cast(ERROR_NUMBER() as varchar(20)) + ' line: '
        + cast(ERROR_LINE() as varchar(20)) + ' ' 
        + ERROR_MESSAGE() + ' > ' 
        + ERROR_PROCEDURE()
    RETURN @ErrorCode                               
end catch

end	--if

END	--sproc
GO
