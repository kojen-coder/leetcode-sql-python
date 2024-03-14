select
s.company_id, s.employee_id, s.employee_name,
round((s.salary * (1-a.tax))) as salary
from salaries s
left join(
select
company_id, max(salary) as max_salary,
case
when max(salary) < 1000 then 0
when max(salary) >= 1000  and max(salary) <= 10000 then 0.24
when max(salary) > 10000 then 0.49
end as tax
from salaries
group by company_id)a
on s.company_id = a.company_id