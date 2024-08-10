select count(*)
from(
    select
        request_id
    from redfin_call_tracking
    where extract(hour from created_on) >= 15 and extract(hour from created_on) <= 17
    group by request_id
    having count(*)>=3
)sq
;