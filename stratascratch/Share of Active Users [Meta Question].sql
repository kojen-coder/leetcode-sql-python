select
cast(sum(case when status = 'open' then 1 else 0 end) as decimal) / count(*) as active_users_share
from fb_active_users
where country = 'USA'
;