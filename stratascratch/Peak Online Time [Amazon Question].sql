select
    user_count,
    start_timestamp || ' to ' || end_timestamp as time_period,
    device_type
from user_activity
where (device_type, user_count) in (
    select device_type, max(user_count) from user_activity group by device_type
)
;