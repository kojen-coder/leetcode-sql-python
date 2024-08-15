# Import your libraries
import pandas as pd

# Start writing code
df = db_employee.merge(db_dept, left_on='department_id', right_on='id', how='inner')
eng_salary = df[df['department'] == 'engineering']['salary'].max()
market_salary = df[df['department'] == 'marketing']['salary'].max()

pd.DataFrame({'salary_differene': [abs(eng_salary - market_salary)]})
