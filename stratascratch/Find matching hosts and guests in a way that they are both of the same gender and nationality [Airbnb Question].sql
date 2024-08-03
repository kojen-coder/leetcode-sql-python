select distinct host_id, guest_id
from
    airbnb_hosts h inner join airbnb_guests g
    on h.nationality = g.nationality and h.gender = g.gender;