import pandas as pd

df = fb_comments_count.merge(fb_active_users, on='user_id', how='inner')
df['created_at'] = pd.to_datetime(df['created_at'])
dec_df = df[(df['created_at'] >= '2019-12-01') & (df['created_at'] <= '2019-12-31')]
jan_df = df[(df['created_at'] >= '2020-01-01') & (df['created_at'] <= '2020-01-31')]
dec_comments = dec_df.groupby('country')['number_of_comments'].sum().reset_index(name='number_of_comments_dec')
jan_comments = jan_df.groupby('country')['number_of_comments'].sum().reset_index(name='number_of_comments_jan')

result = jan_comments.merge(dec_comments, on='country', how='outer')
result['rank_dec'] = result['number_of_comments_dec'].rank(method='dense', ascending=False)
result['rank_jan'] = result['number_of_comments_jan'].rank(method='dense', ascending=False)

result[(result['rank_dec'] > result['rank_jan']) | (result['rank_dec'].isnull())][['country']]

