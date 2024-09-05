with temp as(
    select email_id, label
    from google_gmail_labels
    where label like '%Custom%'
)

select
    e.to_user, t.label, count(*) as n_occurences
from google_gmail_emails e inner join temp t
on e.id = t.email_id
group by e.to_user, t.label

;