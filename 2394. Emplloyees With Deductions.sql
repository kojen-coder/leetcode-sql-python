with temp as(
    select e.employee_id, e.needed_hours, sum(ceil(timestampdiff(minute, in_time, out_time))) as total_hr
    from employees e inner join logs l on e.employee_id = l.employee_id
    group by e.employee_id, e.needed_hours
)

select employee_id from employees
where employee_id not in (select employee_id from temp where (total_hr)/60 >= needed_hours)
order by employee_id
