# Import your libraries
import pandas as pd

# Start writing code
df = signups.merge(plans, left_on='plan_id', right_on='id', how='inner')
df['weekday'] = pd.to_datetime(df['signup_start_date']).dt.dayofweek
df.groupby(['weekday', 'billing_cycle'])['signup_id'].nunique().unstack().fillna(0).reset_index()
