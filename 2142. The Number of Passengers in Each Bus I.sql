with temp as (SELECT p.passenger_id, p.arrival_time as p_arr, min(b.arrival_time) as bus_arr
FROM Buses b, Passengers p WHERE b.arrival_time >= p.arrival_time
GROUP BY p.passenger_id, p.arrival_time)


SELECT b.bus_id, count(distinct t.passenger_id) as passengers_cnt
FROM Buses b
LEFT JOIN temp t on b.arrival_time= t.bus_arr
GROUP BY b.bus_id
order by bus_id