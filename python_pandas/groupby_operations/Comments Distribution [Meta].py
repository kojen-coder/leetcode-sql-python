# Import your libraries
import pandas as pd

# Start writing code
user_df = fb_users[(fb_users['joined_at']>= '2018-01-01') & (fb_users['joined_at']<= '2020-02-01')]
combined_df = user_df.merge(fb_comments, left_on='id', right_on='user_id', how='inner')
combined_df['created_year_month'] = pd.to_datetime(combined_df['created_at']).dt.strftime('%Y-%m')
combined_df = combined_df[(combined_df['joined_at'] <= combined_df['created_at']) & (combined_df['created_year_month'] == '2020-01')]
df1 = combined_df.groupby('id').size().reset_index(name='comment_cnt')
df1.groupby('comment_cnt').size().reset_index(name='user_cnt').sort_values('comment_cnt', ascending=True)
