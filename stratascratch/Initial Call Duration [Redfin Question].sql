with temp as(
select
    request_id,
    created_on,
    sum(call_duration) as total_duration,
    rank() over(partition by request_id order by created_on) as rnk
from redfin_call_tracking
group by request_id, created_on
)

select
    avg(total_duration) as avg
from temp
where rnk = 1
;