with cte as(
    select paid_by as user_id, (-1 * amount) as amount
    from transactions
    union all
    select paid_to as user_id, amount
    from transactions
    union all
    select user_id, credit as amount
    from users
)

select
u.user_id, u.user_name,
sum(c.amount) as credit,
case when sum(c.amount) < 0 then 'Yes' else 'No' end as credit_limit_breached
from cte c inner join users u
on c.user_id=u.user_id
group by u.user_id, u.user_name
