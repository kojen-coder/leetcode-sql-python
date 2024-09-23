# Import your libraries
import pandas as pd

# Start writing code
p1 = winemag_p1[['region_1', 'variety', 'price']].rename(columns={'region_1': 'region'})
p2 = winemag_p1[['region_2', 'variety', 'price']].rename(columns={'region_2': 'region'})
df = pd.concat([p1, p2]).drop_duplicates()
df = df[~df['price'].isnull()]
df = df[~df['region'].isnull()]
df.groupby(['region', 'variety'])['price'].sum().reset_index(name='total').sort_values('total', ascending=False)
