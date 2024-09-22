# Import your libraries
import pandas as pd

# Start writing code
df = winemag_p1.merge(winemag_p2, on=['province'], how='inner')
grouped_df = df.groupby(['province']).agg(p1_count=('id_x', 'nunique'), p2_count=('id_y', 'nunique')).reset_index()
grouped_df[grouped_df['p1_count'] > grouped_df['p2_count']][['province', 'p1_count']].sort_values('p1_count', ascending=False)
