# Import your libraries
import pandas as pd

# Start writing code
lyft_drivers['year'] = pd.to_datetime(lyft_drivers['start_date']).dt.year
df = lyft_drivers.groupby('year').agg(total_start_date = ('start_date', 'nunique'),
            total_end_date = ('end_date', 'nunique')).reset_index()
df['ratio'] = df['total_end_date'] / df['total_start_date']
return pd.DataFrame({'avg': [df['ratio'].mean()]})