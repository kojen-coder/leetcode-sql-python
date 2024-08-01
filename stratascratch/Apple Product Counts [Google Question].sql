select
    u.language,
    count(distinct case when e.device in ('iphone 5s', 'macbook pro', 'ipad air') then e.user_id else null end) as n_apple_users,
    count(distinct e.user_id) as n_total_users

from playbook_events e inner join playbook_users u
on e.user_id = u.user_id
group by u.language
order by n_total_users desc
;
