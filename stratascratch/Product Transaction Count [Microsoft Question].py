# Import your libraries
import pandas as pd

# Start writing code
df = excel_sql_inventory_data.merge(excel_sql_transaction_data, on='product_id', how='inner')
df.groupby(['product_id', 'product_name'])['transaction_id'].count().reset_index(name='count').sort_values('product_id', ascending=True)[['product_name', 'count']]

