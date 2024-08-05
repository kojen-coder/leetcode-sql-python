# Import your libraries
import pandas as pd

# Start writing code
submissions['fixed'] = submissions['rate_type'].apply(lambda x: 1 if x == 'fixed' else 0)
submissions['variable'] = submissions['rate_type'].apply(lambda x: 1 if x == 'variable' else 0)
submissions[['loan_id', 'fixed', 'variable']]