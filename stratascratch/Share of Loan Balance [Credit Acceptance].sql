select
loan_id,
rate_type,
balance,
balance * 100 / sum(balance) over(partition by rate_type) as balance_share
from submissions;