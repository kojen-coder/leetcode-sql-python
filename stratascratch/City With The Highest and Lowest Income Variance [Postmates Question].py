# Import your libraries
import pandas as pd

# Start writing code
postmates_orders['date'] = pd.to_datetime(postmates_orders['order_timestamp_utc']).dt.date
df = postmates_orders.merge(postmates_markets, left_on = 'city_id', right_on = 'id')\
        .groupby(['name', 'date'])['amount'].sum().unstack().reset_index()
df['amount_difference'] = df.iloc[:,2] - df.iloc[:,1]

df[(df['amount_difference'] == df['amount_difference'].min()) |
    (df['amount_difference'] == df['amount_difference'].max()) ][['name', 'amount_difference']]
