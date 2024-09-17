select
    p.team_id,
    avg(s.member_score) as team_score
from google_competition_participants p inner join google_competition_scores s
on p.member_id=s.member_id
group by p.team_id
order by team_score desc
;