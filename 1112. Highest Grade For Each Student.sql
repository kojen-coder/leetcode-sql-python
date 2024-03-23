select
student_id, course_id, grade
from(
    select
    student_id, course_id, grade,
    row_number() over(partition by student_id order by grade desc, course_id) as rnk
    from enrollments
)a
where rnk = 1
order by student_id