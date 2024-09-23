# Import your libraries
import pandas as pd

# Start writing code
yelp_business['rnk'] = yelp_business['review_count'].rank(method='first', ascending=False)
yelp_business[yelp_business['rnk'] <= 5][['name', 'review_count']].sort_values('review_count', ascending=False)
