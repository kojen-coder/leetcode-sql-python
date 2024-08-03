select
e.employee_title,
e.sex,
avg(e.salary + b.bonus) as total_compensation
from
    sf_employee e
inner join
    (select
        worker_ref_id,
        sum(bonus) as bonus
    from sf_bonus
    group by worker_ref_id) b
on e.id = b.worker_ref_id
group by e.employee_title, e.sex
;