select
    date_format(created_at, '%Y-%m'),
    (sum(purchase_amt) +
    COALESCE(lag(sum(purchase_amt)) over(), 0) +
    COALESCE(lag(sum(purchase_amt), 2) over(), 0)) /
    (CASE
        WHEN LAG(SUM(purchase_amt), 2) OVER() IS NOT NULL THEN 3
        WHEN LAG(SUM(purchase_amt)) OVER() IS NOT NULL THEN 2
        ELSE 1
    END) as avg_revenue
from amazon_purchases
where purchase_amt > 0
group by 1
;