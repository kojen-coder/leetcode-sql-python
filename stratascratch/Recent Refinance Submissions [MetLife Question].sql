select l.user_id, s.balance
from(
    select
        distinct id, created_at, user_id,
        max(created_at) over(partition by user_id, type) as max_date
    from loans
    where type = 'Refinance'
)l
inner join submissions s
on l.id = s.loan_id
where l.created_at = l.max_date
;