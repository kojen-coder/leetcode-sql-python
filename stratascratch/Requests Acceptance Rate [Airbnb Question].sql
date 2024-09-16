select
    sum(case when ts_accepted_at is not null then 1 end) * 100 / count(*) as accepted_rate
from airbnb_contacts;