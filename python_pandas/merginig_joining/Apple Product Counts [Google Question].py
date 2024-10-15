# Import your libraries
import pandas as pd

# Start writing code
playbook_events.loc[playbook_events['device'].isin(['iphone 5s', 'ipad air', 'macbook pro']), 'apple_user'] = 1
playbook_events['apple_user'].fillna(0, inplace=True)
df = playbook_events.merge(playbook_users, on='user_id', how='inner')
df1 = df[df['apple_user']==1].groupby('language').agg(n_apple_users=('user_id', 'nunique')).reset_index()
df2 = df.groupby('language').agg(n_total_users=('user_id', 'nunique')).reset_index()
df1.merge(df2, on='language', how='right').fillna(0).sort_values('n_total_users', ascending=False)
