# Import your libraries
import pandas as pd

# Start writing code
df = airbnb_hosts[airbnb_hosts['age'] < 30] # There are multiple duplication in this table
airbnb_units = airbnb_units[airbnb_units['unit_type'] == 'Apartment']
grouped_df = df.merge(airbnb_units, on='host_id', how='inner')
grouped_df.groupby('nationality')['unit_id'].nunique().reset_index(name='apartment_count')

