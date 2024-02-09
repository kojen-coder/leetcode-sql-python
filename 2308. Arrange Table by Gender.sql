select a.user_id, a.gender
from (
    select user_id, gender,
    row_number() over(partition by gender order by user_id asc) as rnk
    from genders
) a
order by a.rnk, a.gender, a.user_id