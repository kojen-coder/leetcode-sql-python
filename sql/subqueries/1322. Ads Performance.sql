select ad_id, ifnull(round(total_c/(total_c + total_v)*100, 2),0) as ctr
from(
select ad_id, sum(case when action='Clicked' then 1 else 0 end) as total_c,
sum(case when action='Viewed' then 1 else 0 end) as total_v
from ads group by ad_id
) a
order by ctr desc, ad_id