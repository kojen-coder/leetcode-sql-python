select from_user,
cnt as total_emails,
DENSE_RANK() over(order by cnt desc, from_user asc) as row_number

from(
    select
    from_user, count(*) as cnt
    from google_gmail_emails
    group by from_user
)subquery;
