# Import your libraries
import pandas as pd

# Start writing code
df = airbnb_hosts.merge(airbnb_apartments, on='host_id', how='inner')
df[df['nationality']!=df['country']]['host_id'].nunique()
