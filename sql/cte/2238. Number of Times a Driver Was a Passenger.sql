with temp as(
    select passenger_id as driver_id, count(*) as cnt
    from rides group by passenger_id
)

select distinct r.driver_id, ifnull(t.cnt, 0) as cnt
from temp t right join rides r on t.driver_id = r.driver_id