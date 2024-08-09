# Import your libraries
import pandas as pd

# Start writing code
df = fact_events.groupby('user_id')['client_id'].nunique().reset_index(name='unique_client')
potential_user = df[(df['unique_client'] == 1)]['user_id']
df = fact_events[(fact_events['user_id'].isin(potential_user)) & (fact_events['client_id'] == 'desktop')]
grouped_df = df.groupby('customer_id')['user_id'].nunique().reset_index(name = 'unique_users')
grouped_df[grouped_df['unique_users'] == grouped_df['unique_users'].max()][['customer_id']]
