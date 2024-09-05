# Import your libraries
import pandas as pd

# Start writing code
df = playbook_events.merge(playbook_users, on='user_id', how='inner')
df.groupby(['location', 'language'])['user_id'].nunique().reset_index(name='n_speakers')

