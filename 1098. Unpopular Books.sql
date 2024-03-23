select book_id, name
from books
where book_id not in(
    select book_id
    from orders
    where dispatch_date between '2018-06-23' and '2019-06-23'
    group by book_id
    having sum(quantity) >= 10 # need to consider those who does not have dispatch date within a year
) and
book_id not in(
    select book_id
    from books
    where available_from between date_sub('2019-06-23', interval 30 day) and '2019-06-23'
)