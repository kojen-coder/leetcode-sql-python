select transaction_id
from(
select
transaction_id,
rank() over(partition by date_format(day, '%Y-%m-%d') order by amount desc) as rnk
from transactions
)a
where rnk =1
order by transaction_id