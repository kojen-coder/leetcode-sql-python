with ranking as(
select
    worker_id,
        salary,
    department,
    rank() over(order by salary desc) as highest,
    rank() over(order by salary) as lowest
from worker
)

select
    worker_id,
    salary,
    department,
    case
        when highest = 1 then 'Highest Salary'
        when lowest = 1 then 'Lowest Salary'
    end as salary_type
from ranking
where highest = 1 or lowest = 1

;