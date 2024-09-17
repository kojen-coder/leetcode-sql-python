# Import your libraries
import pandas as pd

# Start writing code
df = pd.concat([fb_eu_energy, fb_asia_energy, fb_na_energy])
grouped_df = df.groupby('date')['consumption'].sum().reset_index(name='total_energy')
grouped_df[grouped_df['total_energy'] == grouped_df['total_energy'].max()]
