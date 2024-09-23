# Import your libraries
import pandas as pd

# Start writing code
df = winemag_p2.groupby(['country']).agg(total_both=('designation', 'size'), with_designation=('designation', 'count')).reset_index()
df['without_designation'] = df['total_both'] - df['with_designation']
df

