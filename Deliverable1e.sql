alter PROCEDURE GeneratePolicyNumber
    @PetOwnerName	nvarchar(200),
    @policyNumber	char(13) out
AS
--
--	Assumption is pet policies are modeled similar to family car policies.
--	Will support multiple concurrent policy adds without adding performance impacts other than normal inserts.
--	Question i - yes this solution will scale. The incrementing counter is the identity column in 
--		Policies table and this will not lock other records under most isolation levels. Negative
--		side effect is that if policies	are deleted or not completed could end up with unused records
--		and counter values that are easily cleaned up.
--	Question ii - this is probably a good place to place this business logic. Although 
--		separated from normal code base and a little more work to manage updates, it is clean, clear
--		code that takes advantage of intrinsic capabilities of the db to provide powerful capabilities, 
--		something that would be a little more involved to do in code.
--
BEGIN

SET NOCOUNT ON;

declare @petOwnerId int, @policyId int, @petOwnerCountryCode int, @returnValue int

select @policyNumber = '0000000000000'

select @petOwnerId = coalesce(PetOwners.id, 0), @petOwnerCountryCode = Coalesce(Countries.IsoCode, 0)
from PetOwners 
	join Countries on PetOwners.CountryId = Countries.Id
where PetOwners.Name = @PetOwnerName	

if (@petOwnerId > 0 and @petOwnerCountryCode > 0)
begin
	insert into policies (PetOwnerId) values (@petOwnerId)
	
	SELECT @policyId = coalesce(SCOPE_IDENTITY(), 0)

	if (@policyId > 0)
	begin
		select @policyNumber = right('000' + cast(@petOwnerCountryCode as varchar(3)), 3)  + right('0000000000' + cast(@policyId as varchar(10)), 10) 
		
		update policies
		set PolicyNumber = @policyNumber 
		where id = @policyId
	end
	set @returnValue = 0
end
else
begin
	set @returnValue = 999
end

return @returnValue

END	--sproc
GO