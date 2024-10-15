# Import your libraries
import pandas as pd
from datetime import datetime, timedelta

# Start writing code
current_date = pd.to_datetime('2024-01-31')
within_last_30_days = (current_date - timedelta(days=30))
penetration_analysis['last_active_date'] = pd.to_datetime(penetration_analysis['last_active_date'])

penetration_analysis.loc[
    (penetration_analysis['last_active_date'] >= within_last_30_days) &
    (penetration_analysis['sessions'] >= 5) &
    (penetration_analysis['listening_hours'] >= 10),
    'active_users'
] = 1
df = penetration_analysis.groupby('country').agg(
    active_count=('active_users', 'sum'),
    total_count=('active_users', 'size')).reset_index()
df['penetration'] = round(df['active_count'] / df['total_count'], 2)
df[['country', 'penetration']]