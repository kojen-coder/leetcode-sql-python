with temp as(
select day, count(distinct to_user) as receivers, count(distinct from_user) as senders
from google_gmail_emails
group by day
having count(distinct to_user) > count(distinct from_user)
)

select *
from google_gmail_emails
where day in (select day from temp)
;