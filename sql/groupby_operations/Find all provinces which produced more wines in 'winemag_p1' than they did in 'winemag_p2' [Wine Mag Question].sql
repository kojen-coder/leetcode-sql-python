select
    p1.province, count(distinct p1.id) as cnt_1
from winemag_p1 p1 inner join winemag_p2 p2
on p1.province = p2.province
group by p1.province
having count(distinct p1.id) > count(distinct p2.id)
order by cnt_1 desc
;