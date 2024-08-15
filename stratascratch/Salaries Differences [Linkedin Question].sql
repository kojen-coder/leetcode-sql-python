select
abs((select max(salary)
from db_employee e inner join db_dept d
on e.department_id = d.id
where d.department='engineering') -
(select max(salary)
from db_employee e inner join db_dept d
on e.department_id = d.id
where d.department='marketing')) as salary_difference
;