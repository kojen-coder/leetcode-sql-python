with temp as(
    select
        seller_id,
        total_sales,
        product_category,
        market_place,
        month,
        dense_rank() over(partition by product_category order by total_sales desc) as rnk
    from sales_data
    where month = '2024-01'
)

select
    seller_id,
    total_sales,
    product_category,
    market_place,
    month
from temp
where rnk <= 3
;