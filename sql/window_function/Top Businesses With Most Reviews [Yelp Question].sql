select
    name,
    review_count
from (
select
    name,
    review_count,
    rank() over(order by review_count desc) as rnk
from yelp_business
)a
where rnk <= 5
order by review_count desc

;