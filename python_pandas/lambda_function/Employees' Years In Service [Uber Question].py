# Import your libraries
import pandas as pd

# Start writing code
uber_employees['years_spent'] = (uber_employees['termination_date'].fillna(pd.to_datetime('2021-05-01')) - pd.to_datetime(uber_employees['hire_date'])).dt.days / 365

uber_employees['still_employed'] = uber_employees['termination_date'].apply(lambda x: 'Yes' if pd.isnull(x) else 'No')
uber_employees[uber_employees['years_spent'] > 2][['first_name', 'last_name', 'years_spent', 'still_employed']]
