--
--	An index was created on table polices, IX_Policies_Startdate, to optimize retrievals
--		and updates at slight expense to inserts.
--
use ProblemC
select COUNT(*)
from policies
where policyStartdate < '5/18/1980 8:32:17'