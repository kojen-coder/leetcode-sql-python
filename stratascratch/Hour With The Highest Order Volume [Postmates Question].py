# Import your libraries
import pandas as pd

# Start writing code
postmates_orders['date'] = pd.to_datetime(postmates_orders['order_timestamp_utc']).dt.date
postmates_orders['hour'] = pd.to_datetime(postmates_orders['order_timestamp_utc']).dt.hour
df = postmates_orders.groupby(['date', 'hour'])['id'].count().reset_index(name='sum_orders')
df = df.groupby('hour')['sum_orders'].mean().reset_index(name='avg_orders')
df[df['avg_orders'] == df['avg_orders'].max()]
