select
    extract(DOW from signup_start_date) as weekday,
    count(distinct case when p.billing_cycle = 'annual' then signup_id end) as annual,
    count(distinct case when p.billing_cycle = 'monthly' then signup_id end) as monthly,
    count(distinct case when p.billing_cycle = 'quarterly' then signup_id end) as quarterly
from
    signups s inner join plans p
    on s.plan_id = p.id
group by 1
;