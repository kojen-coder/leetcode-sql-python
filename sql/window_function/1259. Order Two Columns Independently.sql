with temp as(
select first_col, second_col,
row_number() over(order by first_col) as f,
row_number() over(order by second_col desc) as s
from data
)

select t1.first_col, t2.second_col
from temp t1 inner join temp t2 on t1.f = t2.s
order by t1.f, t2.s
