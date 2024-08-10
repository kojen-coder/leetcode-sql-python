# Import your libraries
import pandas as pd

# Start writing code
redfin_call_tracking['hour']=pd.to_datetime(redfin_call_tracking['created_on']).dt.hour
df = redfin_call_tracking[(redfin_call_tracking['hour'] >= 15) & (redfin_call_tracking['hour'] <= 17)]
df = df.groupby('request_id')['id'].count().reset_index(name='total')
len(df[df['total']>=3])
