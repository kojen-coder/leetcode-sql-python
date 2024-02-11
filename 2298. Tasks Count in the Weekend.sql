select sum(case when a.dow in (1,7) then 1 else 0 end) as weekend_cnt,
sum(case when a.dow in (2, 3, 4, 5, 6) then 1 else 0 end) as working_cnt
from(
    select task_id, assignee_id, dayofweek(submit_date) as dow
    from tasks
) a