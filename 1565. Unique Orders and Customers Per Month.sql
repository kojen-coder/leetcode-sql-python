select DATE_FORMAT(order_date, '%Y-%m') as month, count(*) as order_count, count(distinct customer_id) as customer_count
FROM Orders
WHERE invoice > 20
GROUP BY month