select
    p.billing_cycle,
    s.signup_id,
    avg(t.amt) as avg_amt
from
    signups s
    inner join transactions t on s.signup_id = t.signup_id
    inner join plans p on p.id = s.plan_id
where t.transaction_start_date < date '2021-03-01' - interval '10 months'
group by p.billing_cycle, s.signup_id
order by p.billing_cycle desc, signup_id
;