select name from salesperson where sales_id not in
(select sales_id from company c, orders o where c.com_id=o.com_id and c.name = 'RED')