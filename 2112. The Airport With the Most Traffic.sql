with temp as(
    select a.airport_id, sum(a.flights_count) as flights_count
    from
    (select departure_airport as airport_id, flights_count
    from flights
    union all
    select arrival_airport as airport_id, flights_count
    from flights) a
    group by a.airport_id
)

select airport_id
from temp where flights_count = (select MAX(flights_count) from temp)