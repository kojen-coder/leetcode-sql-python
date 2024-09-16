# Import your libraries
import pandas as pd

# Start writing code
df = customers.merge(orders, left_on='id', right_on='cust_id', how='left')
df[df['cust_id'].isnull()].shape[0]