with cte as(
select student_id, department_id, mark,
rank() over(partition by department_id order by mark desc) as rk,
count(*) over(partition by department_id) as total_stu
from students
)

select student_id, department_id,
round(ifnull((rk -1)*100 / (total_stu - 1), 0), 2) as percentage
from cte