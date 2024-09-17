select
min(log_id) as start_id, max(log_id) as end_id
from(
    select
    log_id,
    row_number() over(order by log_id) as log_rnk
    from logs
)a
group by (log_id - log_rnk)
order by start_id