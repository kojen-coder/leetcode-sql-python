select distinct sub_id as post_id, ifnull(a.number_of_comments, 0) as number_of_comments
from submissions s left join
(select parent_id as post_id, count(distinct sub_id) as number_of_comments from submissions
group by parent_id) a
on s.sub_id = a.post_id
where s.parent_id is null
order by post_id