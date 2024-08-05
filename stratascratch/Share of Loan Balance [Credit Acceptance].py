# Import your libraries
import pandas as pd

# Start writing code
df = submissions.groupby('rate_type')['balance'].sum().reset_index(name='balance_total')
df = df.merge(submissions, on = 'rate_type', how = 'inner')
df['balance_share'] = df['balance'] * 100 / df['balance_total']
df[['loan_id', 'rate_type', 'balance', 'balance_share']]