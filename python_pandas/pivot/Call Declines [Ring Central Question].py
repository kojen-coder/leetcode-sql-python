# Import your libraries
import pandas as pd

# Start writing code
df = rc_calls.merge(rc_users, on='user_id', how='inner')
df = df[(df['date'] >= '2020-03-01') & (df['date'] <= '2020-04-30')]
df['month'] = pd.to_datetime(df['date']).dt.month
grouped = df.groupby(['company_id', 'month'])['call_id'].count().reset_index()

pivot_df = grouped.pivot(index='company_id', columns='month', values='call_id')
pivot_df['variance'] = pivot_df[4] - pivot_df[3]
result_df = pivot_df[['variance']].reset_index()
result_df[result_df['variance'] == result_df['variance'].min()]