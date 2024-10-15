# Import your libraries
import pandas as pd

# Start writing code
df = facebook_post_views.merge(facebook_posts, on='post_id' , how ='left')
df.loc[df['post_keywords'].str.contains('spam'), 'spam_post'] = 1
df['spam_post'].fillna(0, inplace=True)
df.drop_duplicates()
df_final = df.groupby('post_date').agg(total=('spam_post', 'size'), spam_count=('spam_post', 'sum')).reset_index()
df_final['spam_share'] = df_final['spam_count'] / df_final['total'] * 100
df_final[['post_date', 'spam_share']]