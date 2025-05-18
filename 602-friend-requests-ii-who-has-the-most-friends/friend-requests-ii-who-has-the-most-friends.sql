-- Write your PostgreSQL query statement below
with
ALLIds AS(
    select requester_id as id from RequestAccepted
    union all
    select accepter_id from RequestAccepted
)
select
id,
count(*) as num
from ALLIds
group by 1
order by 2 desc
limit 1;