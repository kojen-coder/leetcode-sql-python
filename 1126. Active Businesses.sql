select
distinct business_id
from(
    select
    business_id,
    event_type,
    occurrences,
    avg(occurrences) over(partition by event_type) as avg_activity
    from events
)a
where occurrences > avg_activity
group by business_id
having count(*) > 1