# Import your libraries
import pandas as pd

# Start writing code
df = fact_events[fact_events['client_id'] == 'mobile'].groupby('customer_id')['event_id'].count().reset_index(name = 'n_events')
df[df['n_events'] == df['n_events'].min()]