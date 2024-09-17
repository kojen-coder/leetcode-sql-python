# Import your libraries
import pandas as pd

# Start writing code
df_filtered = airbnb_reviews[(airbnb_reviews['from_type']=='guest') & (airbnb_reviews['to_type']=='host')]
max_scores = df_filtered.groupby('from_user')['review_score'].max().reset_index()
df_merged = df_filtered.merge(max_scores, on=['from_user', 'review_score'])

df_merged.merge(airbnb_hosts, left_on='to_user', right_on='host_id', how='inner')[['from_user', 'nationality']].drop_duplicates()
