select
    p.title as project,
    round((budget/count(emp_id)::float)::numeric, 0)  as budget_emp_ratio
from ms_projects p inner join ms_emp_projects e
on p.id = e.project_id
group by p.title, budget
order by budget_emp_ratio desc
;