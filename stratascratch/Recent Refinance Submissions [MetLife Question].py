# Import your libraries
import pandas as pd

# Start writing code
loans = loans[loans['type'] == 'Refinance']
loans['created_at'] = pd.to_datetime(loans['created_at'])
most_recent_loans = loans.loc[loans.groupby('user_id')['created_at'].idxmax()]
most_recent_loans.merge(submissions, left_on='id', right_on='loan_id', how='left')[['user_id', 'balance']]
