# Import your libraries
import pandas as pd

# Start writing code
sf_transactions['year_month'] = pd.to_datetime(sf_transactions['created_at']).dt.strftime('%Y-%m')
df = sf_transactions.groupby('year_month')['value'].sum().reset_index(name='total_value').sort_values('year_month', ascending=True)
df['last_month_value'] = df['total_value'].shift(1)
df['revenue_diff_pct'] = round((df['total_value'] - df['last_month_value']) / df['last_month_value'] * 100, 2)
df[['year_month', 'revenue_diff_pct']]