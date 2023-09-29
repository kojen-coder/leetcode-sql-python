select round(count(*) / (select count(*) from delivery) * 100, 2) as immediate_percentage from delivery where order_date = customer_pref_delivery_date
