select seller_id from sales group by seller_id
having sum(price) = (select MAX(total) as maxtotal from (select SUM(price) as total from sales group by seller_id) a)