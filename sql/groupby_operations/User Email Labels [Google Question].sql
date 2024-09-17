select
    e.to_user,
    sum(case when l.label = 'Promotion' then 1 else 0 end) as promotion_count,
    sum(case when l.label = 'Social' then 1 else 0 end) as social_count,
    sum(case when l.label = 'Shopping' then 1 else 0 end) as shopping_count
from google_gmail_emails e inner join google_gmail_labels l
on e.id=l.email_id
group by e.to_user

;