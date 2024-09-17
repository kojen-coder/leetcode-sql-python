with temp as (
    SELECT product_id, purchase_yr, dense_rank() over(order by purchase_yr) as d1,
    dense_rank() over(partition by product_id order by purchase_yr) as d2,
    dense_rank() over(order by purchase_yr) - dense_rank() over(partition by product_id order by purchase_yr) as rk_diff
    FROM
    (SELECT product_id, year(purchase_date) as purchase_yr, count(distinct order_id) as order_count
FROM Orders
GROUP BY product_id, purchase_yr) a1
WHERE order_count >=3
)

select distinct product_id FROM temp
GROUP BY product_id, rk_diff
HAVING count(*) > 1;