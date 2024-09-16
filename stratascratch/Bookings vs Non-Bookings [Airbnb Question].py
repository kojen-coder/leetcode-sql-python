# Import your libraries
import pandas as pd

# Start writing code
booking_df = airbnb_contacts[airbnb_contacts['ts_booking_at'].notnull()]
grouped_df = airbnb_searches.merge(booking_df, left_on=['id_user', 'ds_checkin'], right_on=['id_guest', 'ds_checkin'] , how='left')
grouped_df['action'] = grouped_df['ts_booking_at'].apply(lambda x: 'books' if pd.notnull(x) else 'does not book')
grouped_df.groupby('action')['n_searches'].mean().reset_index(name='average_searches')

