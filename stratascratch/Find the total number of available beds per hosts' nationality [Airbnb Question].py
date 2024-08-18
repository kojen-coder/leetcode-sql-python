# Import your libraries
import pandas as pd

# Start writing code
df = airbnb_apartments.merge(airbnb_hosts, on='host_id', how='inner')
df = df.groupby('nationality')['n_beds'].sum().reset_index(name = 'total_beds_available')
df[['nationality', 'total_beds_available']].sort_values('total_beds_available', ascending=False)