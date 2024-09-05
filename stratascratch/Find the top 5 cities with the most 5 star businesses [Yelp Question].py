# Import your libraries
import pandas as pd

# Start writing code
df = yelp_business[yelp_business['stars'] == 5]
df_grouped = df.groupby('city')['stars'].count().reset_index(name='count_of_5_stars')
df_grouped['rnk'] = df_grouped['count_of_5_stars'].rank(method='min', ascending=False)
df_grouped[df_grouped['rnk'] <= 5][['city', 'count_of_5_stars']]
