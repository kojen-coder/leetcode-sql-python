select
    case when ts_booking_at is not null then 'book' else 'does not book' end as action,
    avg(n_searches) as average_searches
from airbnb_searches s left join (select distinct id_guest, ts_booking_at, ds_checkin from airbnb_contacts where ts_booking_at is not null)
c on s.id_user = c.id_guest and s.ds_checkin = c.ds_checkin
group by 1
;