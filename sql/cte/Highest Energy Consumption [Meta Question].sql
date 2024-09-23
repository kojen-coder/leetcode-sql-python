with temp as(
    select date, consumption from fb_eu_energy
    union all
    select date, consumption from fb_asia_energy
    union all
    select date, consumption from fb_na_energy
),
total as(
    select date, sum(consumption) as total_energy
    from temp
    group by date
)

select date, total_energy
from total
where total_energy = (select max(total_energy) from total)

;