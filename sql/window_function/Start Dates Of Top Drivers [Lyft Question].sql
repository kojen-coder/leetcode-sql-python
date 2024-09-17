select start_date
from (
    select
    start_date,
    rank() over(order by yearly_salary desc) as rnk
    from lyft_drivers
    where end_date is null
) a
where rnk <= 5

;