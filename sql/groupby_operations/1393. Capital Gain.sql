select
stock_name,
sum(
case
    when operation = 'Buy' then -1 * price
    when operation = 'Sell' then price
end) as capital_gain_loss
from stocks
group by stock_name