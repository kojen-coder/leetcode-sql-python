select
    first_name,
    last_name,
    (coalesce(termination_date, '2021-05-01') - hire_date)::float/365 as year_spent,
    case when termination_date IS NULL then 'YES' else 'NO' end as still_employed
from uber_employees
where (coalesce(termination_date, '2021-05-01') - hire_date) > 730
;