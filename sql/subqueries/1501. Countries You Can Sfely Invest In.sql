select country
from(
    select p.id, ct.name as country, ct.country_code, c.duration
    from
        (select id, left(phone_number, 3) as country_code
        from person) p
    inner join country ct
    on p.country_code=ct.country_code
    left join calls c
    on c.caller_id = p.id or c.callee_id = p.id
)a
group by country
having avg(duration) > (select avg(duration) from calls)