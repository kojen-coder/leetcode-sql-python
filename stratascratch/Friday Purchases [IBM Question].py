# Import your libraries
import pandas as pd

# Start writing code
user_purchases['date'] = pd.to_datetime(user_purchases['date'])
friday_purchases = user_purchases[(user_purchases['day_name'] == 'Friday') &
                (user_purchases['date'].dt.quarter == 1)]
friday_purchases = friday_purchases.groupby(friday_purchases['date'].dt.week)['amount_spent'].mean().reset_index(name='mean_amount')
friday_purchases.columns=['week_number', 'mean_amount']
all_weeks = pd.DataFrame({'week_number': range(1, 14)})
all_weeks.merge(friday_purchases, on='week_number' , how='left').fillna(0)
