# Import your libraries
import pandas as pd

# Start writing code
karl_id = users[users['user_name'] == 'Karl']['user_id'].iloc[0]
hans_id = users[users['user_name'] == 'Hans']['user_id'].iloc[0]

karl_friends = friends[friends['user_id'] == karl_id]['friend_id'].tolist()
hans_friends = friends[friends['user_id'] == hans_id]['friend_id'].tolist()

mutual_friends_id = list(set(karl_friends).intersection(hans_friends))
users[users['user_id'].isin(mutual_friends_id)]
