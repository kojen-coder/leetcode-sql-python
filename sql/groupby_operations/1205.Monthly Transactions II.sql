select month, country,
sum(case when state = 'approved' then 1 else 0 end) as approved_count,
sum(case when state = 'approved' then amount else 0 end) as approved_amount,
sum(case when state = 'back' then 1 else 0 end) as chargeback_count,
sum(case when state = 'back' then amount else 0 end) as chargeback_amount
from(
    select
    left(trans_date, 7) as month, country, state, amount
    from transactions
    where state = 'approved'
    union all
    select
    left(c.trans_date, 7) as month, country, "back" as state, amount
    from chargebacks c inner join transactions t
    on c.trans_id=t.id
)a
group by month, country