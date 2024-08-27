select product_name, count
from (
    select i.product_id, i.product_name, count(t.transaction_id) as count
    from excel_sql_inventory_data i inner join excel_sql_transaction_data t
    on i.product_id = t.product_id
    group by i.product_id, i.product_name
    order by i.product_id
)a
;