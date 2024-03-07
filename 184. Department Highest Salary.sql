select department, employee, salary
from (
select
d.name as department,
e.name as employee,
salary,
rank() over(partition by d.id order by e.salary desc) as rnk
from employee e inner join department d
on e.departmentid = d.id
) a
where rnk = 1
