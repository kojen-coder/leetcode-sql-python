with temp as(
    select
        extract(week from date) as week_number,
        avg(amount_spent) as mean_amount
    from user_purchases
    where day_name = 'Friday' and extract(quarter from date) = 1
    group by extract(week from date)
),
all_weeks as(
    select n as week_number
    from unnest(array[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]) as all_weeks(n)
)

select a.week_number, coalesce(mean_amount, 0) as mean_amount
from temp t right join all_weeks a
on t.week_number = a.week_number

;