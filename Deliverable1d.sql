declare @breedname as varchar(50)
set @breedname = 'Lab'
--
--	Note a covering index was created for table pets to optimize retrieval and updates. This
--		will have a slight performance penalty for inserts. A covering index was not needed 
--		for table Breeds as it only has the single attribute column associated with the
--		clustered index on the key. Another strategy could have been to denormalize the 
--		Breeds and Pets table to optimize performance further at the expense of duplicaing
--		values and taking additional space.
--
select p.name as petname, b.name as breedname
from ProblemC.dbo.pets p
join ProblemC.dbo.breeds b on p.breedid = b.id
where b.name = @breedname