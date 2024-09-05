with cte as(
    select city, count(stars) as count_of_5_stars,
    rank() over(order by count(stars) desc) as rnk
    from yelp_business
    where stars = 5
    group by city
)

select city, count_of_5_stars
from cte
where rnk <= 5

;