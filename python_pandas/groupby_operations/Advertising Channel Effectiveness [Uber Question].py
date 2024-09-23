# Import your libraries
import pandas as pd

# Start writing code
uber_advertising = uber_advertising[(uber_advertising['year']==2017) | (uber_advertising['year']==2018)]
df = uber_advertising.groupby('advertising_channel').agg(total_money=('money_spent', 'sum'), total_customers=('customers_acquired', 'sum')).reset_index()
df['effectiveness'] = df['total_money'] / df['total_customers']
return df[['advertising_channel', 'effectiveness']].sort_values('effectiveness', ascending=True)
