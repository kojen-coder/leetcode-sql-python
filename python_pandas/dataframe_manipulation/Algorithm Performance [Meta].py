# Import your libraries
import pandas as pd

# Start writing code
fb_search_events.loc[fb_search_events['clicked']==0, 'rating'] = 1
fb_search_events.loc[(fb_search_events['clicked']!=0) & (fb_search_events['search_results_position']>3), 'rating'] = 2
fb_search_events.loc[(fb_search_events['clicked']!=0) & (fb_search_events['search_results_position']<=3), 'rating'] = 3
fb_search_events.groupby('search_id')['rating'].max().reset_index(name='max_rating')