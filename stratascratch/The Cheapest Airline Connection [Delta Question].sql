with connections as (
    select
        d0.origin origin0, d0.destination destination0, d0.cost cost0,
        d1.origin origin1, d1.destination destination1, d1.cost cost1,
        d2.origin origin2, d2.destination destination2, d2.cost cost2
    from
        da_flights d0
        left join da_flights d1 on d0.destination = d1.origin
        left join da_flights d2 on d1.destination = d2.origin
)

select
    origin, destination, min(cost) as total_cost
from (
    select origin0 as origin, destination0 as destination, cost0 as cost
    from connections
    union all
    select origin0 as origin, destination1 as destination, cost0 + cost1 as cost
    from connections
    union all
    select origin0 as origin, destination2 as destination, cost0 + cost1 + cost2 as cost
    from connections
)subquery
where destination is not null and cost IS NOT NULL
group by origin, destination
order by origin, destination
;