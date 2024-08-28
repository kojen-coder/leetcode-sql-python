# Import your libraries
import pandas as pd

# Start writing code
df = airbnb_contacts.groupby('id_guest')['n_messages'].sum().reset_index(name='total_messages')
df['ranking'] = df['total_messages'].rank(method='dense', ascending=False)
df.sort_values('ranking', ascending=True)
