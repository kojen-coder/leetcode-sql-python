
select en.unique_id, e.name
from employees e left join employeeuni en on e.id=en.id

