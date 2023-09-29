
select project_id from project group by project_id having COUNT(employee_id) =
(select COUNT(employee_id) from project group by project_id order by COUNT(employee_id) DESC limit 1)