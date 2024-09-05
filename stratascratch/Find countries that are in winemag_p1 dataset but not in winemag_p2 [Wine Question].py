# Import your libraries
import pandas as pd

# Start writing code
df1 = winemag_p1[winemag_p1['country'].notnull()][['country']].drop_duplicates()
df2 = winemag_p2[winemag_p2['country'].notnull()][['country']].drop_duplicates()
df_all = df1.merge(df2, on='country', how='left', indicator=True)
result = df_all[df_all['_merge'] == 'left_only'][['country']].sort_values('country')

