select
    team,
    avg(weight) as average_player_weight
from olympics_athletes_events
where sport = 'Judo' and (age >= 20 or age <= 30) and medal is not null
group by team
;