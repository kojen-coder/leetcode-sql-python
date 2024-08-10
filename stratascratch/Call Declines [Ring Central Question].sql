with temp as(
select
    u.company_id,
    EXTRACT(MONTH FROM c.date) AS month,
    count(c.call_id),
    lag(count(c.call_id), 1) over(partition by u.company_id order by EXTRACT(MONTH FROM c.date) desc) - count(c.call_id) as variance
from rc_calls c inner join rc_users u
on c.user_id=u.user_id
where c.date >= '2020-03-01' and c.date <= '2020-04-30'
group by u.company_id, extract(month from c.date)
)

select company_id, variance
from temp
where variance = (select min(variance) from temp)
;