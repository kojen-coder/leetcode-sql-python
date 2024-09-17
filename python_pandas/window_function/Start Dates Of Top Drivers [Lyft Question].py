# Import your libraries
import pandas as pd

# Start writing code
df = lyft_drivers[lyft_drivers['end_date'].isnull()]
df['rnk'] = df['yearly_salary'].rank(method='first', ascending=False)
df[df['rnk'] <= 5][['start_date']]