# Import your libraries
import pandas as pd

# Start writing code
df = yelp_checkin.groupby('business_id')['checkins'].sum().reset_index(name='n_checkins')
df['rnk'] = df['n_checkins'].rank(method='first', ascending=False)
df[df['rnk'] <= 5][['business_id', 'n_checkins']]
