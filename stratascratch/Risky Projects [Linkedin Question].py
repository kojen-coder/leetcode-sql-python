# Import your libraries
import pandas as pd
import numpy as np

# Start writing code
linkedin_projects['start_date'] = pd.to_datetime(linkedin_projects['start_date'])
linkedin_projects['end_date'] = pd.to_datetime(linkedin_projects['end_date'])
linkedin_projects['days'] = ((linkedin_projects['end_date'].dt.date - linkedin_projects['start_date'].dt.date).dt.days)
linkedin_projects['daily_budget'] = linkedin_projects['budget'] / linkedin_projects['days']
linkedin_employees['daily_salary'] = linkedin_employees['salary'] / 365
df = linkedin_employees.merge(linkedin_emp_projects, left_on='id', right_on='emp_id', how='inner')
df = df.groupby('project_id')['daily_salary'].sum().reset_index(name='total_daily_salary')
df = df.merge(linkedin_projects, left_on='project_id', right_on='id', how='inner')
df = df[df['daily_budget'] < df['total_daily_salary']]
df['prorated_expense'] = np.ceil(df['total_daily_salary'] * df['days'])
df[['title', 'budget', 'prorated_expense']]
