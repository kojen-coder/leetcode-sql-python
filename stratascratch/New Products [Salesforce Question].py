# Import your libraries
import pandas as pd

# Start writing code
df = car_launches.groupby(['company_name', 'year']).size().reset_index(name='total_products')
df = df[df['year'].isin([2019, 2020])].sort_values(['company_name', 'year'], ascending=[True, True])
df['prev_value'] = df.groupby('company_name')['total_products'].shift()
df = df[df['year'] == 2020]
df['net_new_products'] = df['total_products'] - df['prev_value']
df[['company_name', 'net_new_products']]

