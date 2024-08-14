# Import your libraries
import pandas as pd

user_activity['time_period'] = user_activity['start_timestamp'].dt.strftime('%Y-%m-%d %H:%M:%S') + ' to ' + user_activity['end_timestamp'].dt.strftime('%Y-%m-%d %H:%M:%S')
df = user_activity.groupby('device_type').apply(lambda x: x[x['user_count'] == x['user_count'].max()])
df[['time_period', 'user_count', 'device_type']]
