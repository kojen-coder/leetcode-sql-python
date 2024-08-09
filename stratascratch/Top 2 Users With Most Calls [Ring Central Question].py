# Import your libraries
import pandas as pd

# Start writing code
rc_calls = rc_calls.merge(rc_users, on='user_id', how='inner')
df = rc_calls.groupby(['company_id', 'user_id'])['call_id'].count().reset_index(name='total')
df['rank'] = df.groupby('company_id')['total'].rank(method='dense', ascending = False)
df[df['rank'] <= 2][['company_id', 'user_id', 'rank']]