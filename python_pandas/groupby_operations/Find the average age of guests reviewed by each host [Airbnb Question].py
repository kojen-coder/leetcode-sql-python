# Import your libraries
import pandas as pd

# Start writing code
df = airbnb_reviews.merge(airbnb_guests, left_on='to_user', right_on='guest_id', how='inner')
df[df['from_type']=='host'].groupby('from_user')['age'].mean().reset_index(name='average_age')