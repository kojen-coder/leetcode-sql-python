# Import your libraries
import pandas as pd

# Start writing code
df = fact_events.groupby('user_id')['client_id'].nunique().reset_index(name='client_num')
df[df['client_num'] == 1]['user_id'].groupby('client_id')['user_id'].nunique().reset_index(name='count')