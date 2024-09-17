select
t.team_id, t.team_name
sum(case
    when t.team_id = m.host_team and host_goals > guest_goals then 3
    when t.team_id = m.host_team and host_goals = guest_goals then 1
    when t.team_id = m.guest_team and host_goals < guest_goals then 3
    when t.team_id = m.guest_team and host_goals = guest_goals then 1
    else 0
end) as num_points
from teams t
left join matches m on t.team_id = m.host_team or t.team_id = m.guest_team
group by t.team_id, t.team_name
order by num_points desc, team_id