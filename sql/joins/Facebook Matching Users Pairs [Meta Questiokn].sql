select e1.id as employee_1, e2.id as employee_2
from facebook_employees e1, facebook_employees e2
where e1.location=e2.location and e1.age <> e2.age and e1.gender=e2.gender
and e1.is_senior<>e2.is_senior

;