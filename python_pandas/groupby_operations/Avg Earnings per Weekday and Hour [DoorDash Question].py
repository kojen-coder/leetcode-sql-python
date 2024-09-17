# Import your libraries
import pandas as pd

# Start writing code
doordash_delivery['weekday'] = pd.to_datetime(doordash_delivery['customer_placed_order_datetime']).dt.day_name()
doordash_delivery['hour'] = pd.to_datetime(doordash_delivery['customer_placed_order_datetime']).dt.hour

doordash_delivery['final_order_value'] = (
    doordash_delivery["order_total"] -
    doordash_delivery['discount_amount'] +
    doordash_delivery['tip_amount'] -
    doordash_delivery['refunded_amount']
)

doordash_delivery.groupby(['weekday', 'hour'])['final_order_value'].mean().round(2).reset_index()
