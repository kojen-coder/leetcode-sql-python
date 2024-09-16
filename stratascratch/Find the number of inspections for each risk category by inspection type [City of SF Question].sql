select
    inspection_type,
    sum(case when risk_category is null then 1 else 0 end) as no_risk_results,
    sum(case when risk_category = 'Low Risk' then 1 else 0 end) as low_risk_results,
    sum(case when risk_category = 'Moderate Risk' then 1 else 0 end) as medium_risk_results,
    sum(case when risk_category = 'High Risk' then 1 else 0 end) as high_risk_results,
    count(*) as total_inspections
from sf_restaurant_health_violations
group by inspection_type
order by total_inspections desc
;