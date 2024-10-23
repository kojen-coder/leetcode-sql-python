# Import your libraries
import pandas as pd

# Start writing code
df = amazon_purchases[amazon_purchases['purchase_amt'] > 0]
df['year_month'] = pd.to_datetime(df['created_at']).dt.strftime('%Y-%m')
df1 = df.groupby('year_month')['purchase_amt'].sum().reset_index(name='monthly_revenue')
df1.set_index('year_month', inplace=True)
rolling_window = df1.rolling(3, min_periods=1).mean()
rolling_window.to_records()