select
invoice_id, customer_name, price, contacts_cnt, trusted_contacts_cnt
from invoices i left join
(
    select
    c.customer_id, c.customer_name,
    count(contact_name) as contacts_cnt,
    sum(case when contact_name in (select customer_name from customers) then 1 else 0
    end) as trusted_contacts_cnt
    from customers c left join contacts ct
    on c.customer_id = ct.user_id
    group by c.customer_id, c.customer_name
)a
on i.user_id = a.customer_id
order by invoice_id