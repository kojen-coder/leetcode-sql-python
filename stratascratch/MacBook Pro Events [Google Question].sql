select
    u.company_id, u.language, count(*) as n_macbook_pro_events
from playbook_events e inner join playbook_users u
on e.user_id = u.user_id
where e.device = 'macbook pro' and e.location = 'Argentina'
and u.language != 'spanish'
group by u.company_id, u.language
;