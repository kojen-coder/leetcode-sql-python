# Import your libraries
import pandas as pd

# Start writing code
df = spotify_daily_rankings_2017_us.merge(spotify_worldwide_daily_song_ranking, on=['trackname', 'date', 'position'], how='inner')
df.groupby('trackname')['date'].count().reset_index()