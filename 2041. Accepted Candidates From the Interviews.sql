SELECT distinct a.candidate_id FROM
(SELECT c.candidate_id, c.interview_id,
sum(r.score) over( partition by interview_id) as total_score
FROM Candidates c INNER JOIN Rounds r on c.interview_id=r.interview_id
where years_of_exp>=2) a
WHERE total_score > 15