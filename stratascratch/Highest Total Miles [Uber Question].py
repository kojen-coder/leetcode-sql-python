# Import your libraries
import pandas as pd

# Start writing code
df = my_uber_drives[my_uber_drives['category']=='Business']
df.groupby('purpose')['miles'].sum().reset_index(name='total_miles').sort_values(
    'total_miles', ascending=False).iloc[:3]