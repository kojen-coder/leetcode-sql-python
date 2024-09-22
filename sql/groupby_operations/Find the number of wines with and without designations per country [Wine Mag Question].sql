select
    country,
    sum(case when designation is null then 1 else 0 end) as total_without_designation,
    sum(case when designation is not null then 1 else 0 end) as total_with_designation,
    count(*) as grand_total
from winemag_p2
group by country
;