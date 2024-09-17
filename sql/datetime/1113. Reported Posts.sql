
select extra as report_reason, count(distinct post_id) as report_count from actions where action_date = date '2019-07-05' - interval '1' day and action = 'report' group by extra