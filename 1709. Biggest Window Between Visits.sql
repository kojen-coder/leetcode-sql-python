select
user_id, max(date_diff) as biggest_window
from(
    select
    user_id,
    Datediff(lead(visit_date, 1, '2021-1-1') over(partition by user_id order by visit_date asc), visit_date) as date_diff
    from UserVisits
) a
group by user_id
order by user_id
