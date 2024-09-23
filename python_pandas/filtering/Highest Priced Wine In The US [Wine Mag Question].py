# Import your libraries
import pandas as pd

# Start writing code
variety_list = winemag_p1[(winemag_p1['country'] == 'Spain') | (winemag_p1['country'] == 'Argentina')]['variety']
df = winemag_p1[~winemag_p1['variety'].isin(variety_list)]
min_variety = df.groupby('variety')['points'].min().reset_index(name='min_points_per_variety')
variety_90 = min_variety[min_variety['min_points_per_variety'] >= 90]['variety']
filtered_df = df[(df['country'] == 'US') & (df['variety'].isin(variety_90))]
filtered_df.groupby('variety')['price'].max().reset_index()
