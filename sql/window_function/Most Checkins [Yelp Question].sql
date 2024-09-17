select
    business_id, n_checkins
from (
    select
        business_id,
        sum(checkins) as n_checkins,
        rank() over(order by sum(checkins) desc) as rnk
    from yelp_checkin
    group by business_id
)a
where rnk <= 5
;