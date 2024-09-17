with cte as (
    select s.school_id, min(e.score) as score
    from schools s, exam e
    where s.capacity >= e.student_count
    group by s.school_id
)

select s.school_id, ifnull(c.score, -1) as score
from schools s left join cte c
on s.school_id = c.school_id