with temp as(
    select region_1 as region, variety, price
    from winemag_p1
    union
    select region_2 as region, variety, price
    from winemag_p1
)

select
    region, variety,
    sum(price)
from temp
where price is not null and region is not null
group by region, variety
order by sum(price) DESC
;