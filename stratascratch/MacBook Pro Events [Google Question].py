# Import your libraries
import pandas as pd

# Start writing code
p1 = playbook_events[(playbook_events['device'] == 'macbook pro') & (playbook_events['location'] == 'Argentina')]
p2 = playbook_users[playbook_users['language'] != 'spanish']
df = p1.merge(p2, on='user_id', how='inner')
df.groupby(['company_id', 'language'])['event_name'].count().reset_index(name = 'n_events')
