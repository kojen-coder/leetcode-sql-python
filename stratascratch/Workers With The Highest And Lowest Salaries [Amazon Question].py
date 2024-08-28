# Import your libraries
import pandas as pd

# Start writing code
worker_highest = worker[worker['salary'] == worker['salary'].max()]
worker_lowest = worker[worker['salary'] == worker['salary'].min()]
worker_highest['salary_type'] = 'Highest Salary'
worker_lowest['salary_type'] = 'Lowest Salary'
pd.concat([worker_highest, worker_lowest])[['worker_id', 'salary', 'department', 'salary_type']]
