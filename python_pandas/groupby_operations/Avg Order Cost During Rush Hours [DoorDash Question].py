# Import your libraries
import pandas as pd

# Start writing code
delivery_details['hour'] = pd.to_datetime(delivery_details['customer_placed_order_datetime']).dt.hour
df = delivery_details[(delivery_details['hour'] >= 15) & (delivery_details['hour'] <= 17)]
df['final_order_value'] = df['order_total']	- df['discount_amount'] + df['tip_amount'] -		df['refunded_amount']
df[df['delivery_region'] == 'San Jose'].groupby('hour').agg(final_order_value=('final_order_value', 'mean')).reset_index()

