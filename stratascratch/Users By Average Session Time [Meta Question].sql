with rank_table as(
select user_id, date(timestamp),
max(case when action = 'page_load' then timestamp end) as early,
min(case when action = 'page_exit' then timestamp end) as late
from facebook_web_log
group by 1, 2
)

select user_id, avg(late - early) as avg_session_duration
from rank_table
group by user_id having avg(late-early) is not null
;
