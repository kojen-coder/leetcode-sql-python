# Import your libraries
import pandas as pd
from datetime import datetime

# Start writing code
amazon_transactions['created_at'] = pd.to_datetime(amazon_transactions['created_at']).dt.strftime('%m-%d-%Y')
df = amazon_transactions.sort_values(by=['user_id', 'created_at'], ascending=[True, True])
df['prev_value'] = df.groupby('user_id')['created_at'].shift()
df['difference'] = (pd.to_datetime(df['created_at']) - pd.to_datetime(df['prev_value'])).dt.days
pd.DataFrame({'user_id': df[df['difference'] <= 7]['user_id'].unique()})

