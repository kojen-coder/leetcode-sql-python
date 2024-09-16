# Import your libraries
import pandas as pd

# Start writing code
df_filtered = olympics_athletes_events[(olympics_athletes_events['age'] >= 20) |  (olympics_athletes_events['age'] <= 30)]
df = df_filtered[(df_filtered['sport']=='Judo') & (df_filtered['medal'].notnull())]
df.groupby('team')['weight'].mean().reset_index(name='avg_weight')

