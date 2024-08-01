with temp as(
select
    p.title,
    ceiling(DATEDIFF(p.end_date, p.start_date) * (sum(e.salary) / 365)) as prorated_salary,
    p.budget
from
    linkedin_projects p
    inner join linkedin_emp_projects l on p.id = l.project_id
    inner join linkedin_employees e on l.emp_id = e.id
group by
    p.title, p.budget, p.end_date, p.start_date
)

select
    title,
    budget,
    prorated_salary as prorated_employee_expense
from
    temp
where
    budget < prorated_salary
order by
    title
;