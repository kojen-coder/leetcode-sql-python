# Import your libraries
import pandas as pd
import numpy as np

# Start writing code
uber_request_logs['year_month'] = pd.to_datetime(uber_request_logs['request_date']).dt.strftime('%Y-%m')
df = uber_request_logs.groupby('year_month').agg(total_distance = ('distance_to_travel', 'sum'), total_monetary_cost = ('monetary_cost', 'sum')).reset_index()
df['actual_value'] = df['total_distance'] / df['total_monetary_cost']
df['forecast_value'] = df['actual_value'].shift(1)
result = round(np.sqrt(np.mean(np.square(df['actual_value'] - df['forecast_value']))), 2)
pd.DataFrame({'RMSE': [result]})
