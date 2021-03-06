--
--	A covering index, IX_Pets_Birthdays was created on Pets to optimize retrieval, updates from/on Pets
--		table at slight impact to inserts. Same index was not created on Petowners since nearly all 
--		attributes are returned.
--
SELECT p.name as petname, p.dateofbirth, po.name as ownername, po.address, po.city, po.state, po.zip
FROM [ProblemC].[dbo].[Pets] p
join [ProblemC].[dbo].[Petowners] po on p.petownerid = po.id
where Month(p.dateofbirth) = Month(GETDATE())
and DAY(p.dateofbirth) = Day(GetDate())