select e1.employee_id
from employees e1
inner join employees e2 on e1.manager_id = e2.employee_id
inner join employees e3 on e2.manager_id = e3.employee_id
where e1.employee_id != 1 and e3.manager_id = 1