# Import your libraries
import pandas as pd

# Start writing code
df = airbnb_apartments.groupby('host_id')['n_beds'].sum().reset_index(name='total')
df['rank'] = df['total'].rank(method='dense', ascending=False)
df.sort_values('rank', ascending=True)