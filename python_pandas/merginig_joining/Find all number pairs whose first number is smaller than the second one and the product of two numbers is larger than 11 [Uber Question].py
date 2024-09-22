# Import your libraries
import pandas as pd

# Start writing code
df = transportation_numbers.merge(transportation_numbers, how='cross')
return df[(df['number_x'] < df['number_y']) & (df['number_x'] * df['number_y'] > 11)][['number_x', 'number_y']].drop_duplicates()