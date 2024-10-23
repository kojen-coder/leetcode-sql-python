# Import your libraries
import pandas as pd
import numpy as np

# Start writing code
uber_request_logs['distance_per_dollar'] = uber_request_logs['distance_to_travel'] / \
    uber_request_logs['monetary_cost']
uber_request_logs['month_year'] = pd.to_datetime(uber_request_logs['request_date']).dt.strftime('%Y-%m')
monthly_distance_df = uber_request_logs.groupby('month_year')['distance_per_dollar'].mean().reset_index(name='avg_distance_per_dollar')
df = uber_request_logs.merge(monthly_distance_df, on='month_year', how='left')
df['difference_in_distance_per_dollar'] = np.abs(df['distance_per_dollar'] - df['avg_distance_per_dollar'])
df.groupby('month_year')['difference_in_distance_per_dollar'].mean().reset_index(name='mean_deviation').sort_values('month_year', ascending=True)

