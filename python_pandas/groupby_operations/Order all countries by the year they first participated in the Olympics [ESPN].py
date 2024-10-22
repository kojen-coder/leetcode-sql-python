# Import your libraries
import pandas as pd

# Start writing code
olympics_athletes_events.groupby('noc')['year'].min().reset_index()\
    .sort_values(['year', 'noc'], ascending=[True,True])