select count(distinct r.post_id) as n_posts_with_a_like
from facebook_reactions r inner join facebook_posts p
on r.post_id=p.post_id
where reaction = 'like'
;