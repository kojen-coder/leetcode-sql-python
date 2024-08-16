# Import your libraries
import pandas as pd

# Start writing code
ms_projects = ms_projects.merge(ms_emp_projects, left_on='id', right_on='project_id', how='inner')
df = ms_projects.groupby(['title', 'budget'])['emp_id'].size().reset_index(name='employee_count')
df['budget_emp_ratio'] = (df['budget'] / df['employee_count']).round()
df[['title', 'budget_emp_ratio']].sort_values('budget_emp_ratio', ascending=False)
