# Import your libraries
import pandas as pd

# Assuming 'worker' is your DataFrame
df = worker.merge(title, left_on = 'worker_id', right_on = 'worker_ref_id')
max_salary = df['salary'].max()
highest_paid_employee = df[df['salary'] == max_salary]

pd.DataFrame({'best_paid_title': highest_paid_employee['worker_title']})

