# Import your libraries
import pandas as pd

# Start writing code
df = lyft_rides_log.groupby('user_id')['distance'].sum().reset_index()
df.merge(lyft_users, left_on='user_id', right_on='id', how='inner')[['id', 'name', 'distance']].sort_values('distance', ascending=False).iloc[:10]