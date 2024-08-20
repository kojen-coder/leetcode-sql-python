select facility_name, min(score) as min_score
from los_angeles_restaurant_health_inspections
where facility_address ilike '%Hollywood Blvd%'
group by facility_name
order by min_score desc, facility_name
;