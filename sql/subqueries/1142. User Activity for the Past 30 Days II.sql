select ROUND(ifnull(AVG(total), 0), 2) as average_sessions_per_user
from (
    select count(distinct session_id) as total from activity
    where activity_date > '2019-06-27' and activity_date <= '2019-07-27'
    group by user_id
) a