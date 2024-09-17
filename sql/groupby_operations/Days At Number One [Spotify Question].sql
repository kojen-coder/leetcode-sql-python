select
u.trackname,
count(*) as n_days_on_n1_position
from spotify_daily_rankings_2017_us u inner join spotify_worldwide_daily_song_ranking w
on u.trackname=w.trackname and u.position=w.position and u.date=w.date
group by u.trackname
;