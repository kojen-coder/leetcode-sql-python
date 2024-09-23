select
    advertising_channel,
    sum(money_spent) / sum(customers_acquired) as avg_effectiveness
from uber_advertising
where year = 2017 or year = 2018
group by advertising_channel
order by avg_effectiveness
;