# Import your libraries
import pandas as pd

# Start writing code
df = redfin_call_tracking.sort_values(['request_id', 'created_on'], ascending=[True, True])
df['rank'] = df.groupby('request_id')['created_on'].rank(method='first', ascending=True)
avg = df[df['rank'] != 1]['call_duration'].mean()
pd.DataFrame({'avg': [avg]})