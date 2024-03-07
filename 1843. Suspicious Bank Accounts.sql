with temp as(
    select t.account_id, date_format(t.day, '%Y%m') as months,
    sum(t.amount) as total_amount, a.max_income
    from accounts a inner join transactions t on a.account_id = t.account_id
    where t.type = 'creditor'
    group by t.account_id, months, a.max_income
    having a.max_income < total_amount
)

select distinct t2.account_id
from temp t1 inner join temp t2 on t1.account_id = t2.account_id
where period_diff(t1.months, t2.months) = 1
