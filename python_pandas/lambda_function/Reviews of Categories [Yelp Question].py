# Import your libraries
import pandas as pd

# Start writing code
result = yelp_business[['review_count', 'categories']].set_index('review_count').apply(
    lambda x: x.str.split(';').explode()).reset_index()

result.groupby('categories')['review_count'].sum().reset_index(name='total_reviews').sort_values('total_reviews', ascending=False)