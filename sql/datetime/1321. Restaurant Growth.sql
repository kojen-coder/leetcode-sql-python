with temp as(
    select
    distinct c1.visited_on as start_date,
    c2.visited_on as end_date
    from customer c1 inner join customer c2
    on c2.visited_on = date_add(c1.visited_on, interval 6 day)
)

select
date_format(date_add(t.start_date, interval 6 day), '%Y-%m-%d') as visited_on,
sum(c.amount) as amount,
round((sum(c.amount)/7), 2) as average_amount
from temp t, customer c
where c.visited_on between t.start_date and t.end_date
group by t.start_date
order by visited_on