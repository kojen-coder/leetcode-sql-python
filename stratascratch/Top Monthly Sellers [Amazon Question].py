# Import your libraries
import pandas as pd

# Start writing code
sales_data = sales_data[sales_data['month'].dt.month == 1]
sales_data['rank'] = sales_data.groupby('product_category')['total_sales'].rank(method='dense', ascending=False)
sales_data[sales_data['rank'] <= 3].sort_values(['product_category', 'rank'])[['seller_id', 'total_sales', 'product_category', 'market_place', 'month']]