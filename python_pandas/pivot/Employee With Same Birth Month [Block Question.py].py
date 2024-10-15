# Import your libraries
import pandas as pd

# Start writing code
df = employee_list.groupby(['profession', 'birth_month']).size().reset_index(name='employee_count')
pivot_df = df.pivot_table(index='profession', values='employee_count', columns='birth_month', fill_value=0).reset_index()

pivot_df.columns = ['department'] + [f'Month_{month}' for month in range(1, 13)]
pivot_df