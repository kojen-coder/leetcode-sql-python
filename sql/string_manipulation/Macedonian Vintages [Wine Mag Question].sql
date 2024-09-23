select distinct
    title,
    cast(regexp_substr(title,'[0-9]{4}') as unsigned) as year
from winemag_p2
where country = 'Macedonia'
;