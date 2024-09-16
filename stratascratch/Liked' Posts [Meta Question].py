# Import your libraries
import pandas as pd

# Start writing code
df = facebook_reactions.merge(facebook_posts, on='post_id', how='inner')
df[df['reaction'] == 'like']['post_id'].nunique()
