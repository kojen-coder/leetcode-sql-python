# Import your libraries
import pandas as pd

# Start writing code
df = redfin_call_tracking.sort_values(['request_id', 'created_on'], ascending=[True, True])
df_final = df.drop_duplicates(subset='request_id', keep='first')
pd.DataFrame({'avg': [df_final['call_duration'].mean()]})