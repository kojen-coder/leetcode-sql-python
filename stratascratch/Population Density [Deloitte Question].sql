with temp as(
    select city, country,
        population/nullif(area, 0) as density
    from cities_population
)

select city, country, density
from temp
where density = (select max(density) from temp) or density = (select min(density) from temp)
;