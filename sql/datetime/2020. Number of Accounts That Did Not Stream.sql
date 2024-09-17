select count(*) as accounts_count
from subscriptions
where (year(start_date) = 2021 or year(end_date) = 2021) and
account_id not in (select account_id from streams where year(stream_date) = 2021)
