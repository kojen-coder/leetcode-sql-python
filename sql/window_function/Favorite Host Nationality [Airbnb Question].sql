with temp as(
select
    r.from_user,
    rank() over(partition by r.from_type order by r.review_score desc) as rnk,
    h.nationality
from airbnb_reviews r inner join airbnb_hosts h
on r.to_user=h.host_id
where r.from_type = 'guest' and r.to_type='host'
)

select distinct from_user, nationality
from temp
where rnk = 1

;