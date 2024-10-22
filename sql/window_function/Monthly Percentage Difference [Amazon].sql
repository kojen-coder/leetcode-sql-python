select
date_format(created_at, '%Y-%m') as ym,
round((sum(value) - lag(sum(value)) over()) / lag(sum(value)) over() * 100, 2) as revenue_diff_pct
from sf_transactions
group by 1
order by 1
;
