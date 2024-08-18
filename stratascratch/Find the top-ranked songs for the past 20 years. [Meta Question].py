# Import your libraries
import pandas as pd
from datetime import datetime

# Start writing code
billboard_top_100_year_end['year_diff'] = datetime.now().year - billboard_top_100_year_end['year']
billboard_top_100_year_end[(billboard_top_100_year_end['year_rank'] == 1) &
(billboard_top_100_year_end['year_diff'] <= 20)]['song_name'].unique()