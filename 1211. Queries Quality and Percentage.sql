# Write your MySQL query statement below

SELECT a.query_name, round(avg(a.quality),2) as quality,
round(avg(CASE WHEN a.rating <3 THEN 1 ELSE 0 END) * 100, 2) as poor_query_percentage
FROM
(SELECT query_name, position, rating, rating/position as quality
FROM Queries) a
GROUP BY a.query_name