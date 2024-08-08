# Import your libraries
import pandas as pd

# Start writing code
df = signups.merge(transactions, on = 'signup_id', how = 'inner')\
        .merge(plans, left_on='plan_id', right_on='id', how = 'inner')
df['transaction_start_date'] = pd.to_datetime(df['transaction_start_date'])
target_date = pd.to_datetime('2021-03-01') - pd.DateOffset(months=10)
df[df['transaction_start_date'] < target_date].groupby(['billing_cycle', 'signup_id'])['amt'].mean().reset_index().sort_values(['billing_cycle', 'signup_id'], ascending=[False, True])
