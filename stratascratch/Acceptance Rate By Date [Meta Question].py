# Import your libraries
import pandas as pd

# Start writing code
sent_df = fb_friend_requests[fb_friend_requests['action']=='sent']
accepted_df = fb_friend_requests[fb_friend_requests['action']=='accepted']
df = sent_df.merge(accepted_df, left_on=['user_id_sender', 'user_id_receiver'], right_on=['user_id_sender', 'user_id_receiver'], how='left')
df = df.groupby('date_x').count().reset_index()
df['acceptance_rate'] = df['action_y'] / df['action_x']
df[['date_x', 'acceptance_rate']]
