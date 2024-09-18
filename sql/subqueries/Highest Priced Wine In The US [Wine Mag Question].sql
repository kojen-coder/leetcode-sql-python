select variety, max(price) as max
from winemag_p1
where variety in (
    select variety
    from winemag_p1
    where variety not in
        (select variety from winemag_p1
        where country in ('Spain', 'Argentina'))
    group by variety
    having min(points) >= 90
    )
and country = 'US'
group by variety

;