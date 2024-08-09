# Import your libraries
import pandas as pd

# Start writing code
boston_id = postmates_markets[postmates_markets['name'] == 'Boston']['id']
pizza_name = postmates_partners[postmates_partners['name'].str.contains('Pizza', case=False)][['id', 'name']]
df = postmates_orders[postmates_orders['city_id'].isin(boston_id)].merge(pizza_name, left_on='seller_id', right_on='id')
df.groupby('name')['amount'].mean().reset_index()