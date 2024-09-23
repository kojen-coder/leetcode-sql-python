select c.customer_id, c.name from customers c
inner join (
    select o.customer_id, p.price, o.quantity
    from product p, orders o where p.product_id = o.product_id
    group by o.customer_id, DATE_FORMAT(o.order_date, '%Y-%M') in ('2020-06', '2020-07')
    having sum(if(o.order_date LIKE '2020-06%', p.price * o.quantity, 0)) >=100 and
    sum(if(o.order_date LIKE '2020-07%', p.price * o.quantity, 0)) >=100
) a on c.customer_id = a.customer_id