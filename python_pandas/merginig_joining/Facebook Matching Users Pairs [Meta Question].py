# Import your libraries
import pandas as pd

# Start writing code
df = facebook_employees.merge(facebook_employees, on=['location', 'gender'], how='inner')
df[(df['age_x'] != df['age_y']) & (df['is_senior_x'] != df['is_senior_y'])].rename(columns={'id_x': 'employee_1', 'id_y': 'employee_2'})[['employee_1', 'employee_2']]