select distinct id, name
from(
    select
    l.id,
    a.name,
    datediff(l.login_date,
    lag(l.login_date, 4) over(partition by l.id order by l.login_date)) as lag4
    from(
        select distinct id, login_date from logins # Because there might be 2 same dates
    ) l inner join accounts a
    on a.id=l.id
)c
where lag4 = 4
order by id