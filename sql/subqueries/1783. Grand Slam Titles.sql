select a.player_id, p.player_name, count(*) as grand_slams_count

from (
    select wimbledon as player_id
    from Championships
    union all
    select fr_open as player_id
    from Championships
    union all
    select us_open as player_id
    from Championships
    union all
    select au_open as player_id
    from Championships
) a inner join players p on a.player_id=p.player_id
group by a.player_id