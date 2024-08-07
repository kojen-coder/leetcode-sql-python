# Import your libraries
import pandas as pd

# Start writing code
df = twitch_sessions.groupby(['user_id', 'session_type'])['session_id'].size().unstack().reset_index().rename(columns = {'streamer': 'streaming'})
df[df['streaming'] > df['viewer']]