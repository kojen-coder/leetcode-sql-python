select department, employee, salary
from (
    select d.name as department, e.name as employee, e.salary,
    dense_rank() over(partition by e.departmentId order by e.salary desc) as rnk
    from employee e inner join department d
    on e.departmentId = d.id
) a
where rnk < 4