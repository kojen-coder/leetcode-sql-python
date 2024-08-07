with temp as(
    select
    user_id,
    sum(case when session_type = 'streamer' then 1 end) as streaming,
    sum(case when session_type = 'viewer' then 1 end) as viewer
    from twitch_sessions
    group by user_id
)

select *
from temp
where streaming > viewer
;