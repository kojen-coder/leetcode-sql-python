With tmp as (
    SELECT team_id, sum(points_change) as points_change
    FROM PointsChange GROUP BY team_id
)

SELECT a.team_id, a.name, CAST(a.rank1 AS SIGNED) - CAST(a.rank2 AS SIGNED) as rank_diff
FROM
(SELECT t.team_id, t.name, t.points, t.points+t1.points_change  as new_point,
rank() over(order by t.points desc, T.name) as rank1,
row_number() over(order by t.points+t1.points_change desc, T.name) as rank2
FROM TeamPoints t LEFT JOIN tmp t1 on t.team_id=t1.team_id) a