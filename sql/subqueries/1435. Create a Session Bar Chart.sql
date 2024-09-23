(select "[0-5>" as bin, count(*) as total
from sessions where duration < 5*60)
UNION
(select "[5-10>" as bin, count(*) as total
from sessions where duration > 5*60 and duration < 10*60)
UNION
(select "[10-15>"  as bin, count(*) as total
from sessions where duration >= 10*60 and duration < 15*60)
UNION
(select "15 or more" as bin, count(*) as total
from sessions where duration > 15*60)


## The other way to tackle this problem:
# SELECT b.bin, IFNULL(COUNT(a.session_id),0) AS total
# FROM
# (SELECT session_id, CASE
# WHEN duration/60 >=0 and duration/60 < 5 THEN '[0-5>'
# WHEN duration/60 >=5 and duration/60 < 10 THEN '[5-10>'
# WHEN duration/60 >=10 and duration/60 < 15 THEN '[10-15>' ELSE '15 or more' END AS bin FROM Sessions) a
# RIGHT JOIN
#  (SELECT '[0-5>' AS bin
#      UNION ALL
#      SELECT '[5-10>' AS bin
#      UNION ALL
#      SELECT '[10-15>' AS bin
#      UNION ALL
#      SELECT '15 or more' AS bin) b
#         ON b.bin=a.bin
# GROUP BY b.bin