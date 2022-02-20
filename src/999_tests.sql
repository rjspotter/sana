
select
  count(distinct "Claim Number")
from
  raw_claim_line_items
where "Claim Number" not in (select distinct "Claim Number" from raw_claims);

select count(*) from raw_patients where "Member ID" is null;

select count(*) from raw_claims where "Patient ID" is null;
