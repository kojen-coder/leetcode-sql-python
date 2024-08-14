# Import your libraries
import pandas as pd

friendships = friendships.drop_duplicates()
likes = likes.drop_duplicates()
friendships_reversed = friendships.rename(columns={'user_name1': 'user_name2', 'user_name2': 'user_name1'})
all_friendships = pd.concat([friendships, friendships_reversed]).drop_duplicates()

user_posts = user_posts.rename(columns={'user_name': 'poster_name'})
merged_likes = user_posts.merge(likes, on='post_id')
merged_final = merged_likes.merge(all_friendships, left_on=['user_name', 'poster_name'], right_on=['user_name1', 'user_name2'], how='inner')

merged_final = merged_final.drop_duplicates(subset=["post_id", "user_name"])
merged_final['date_liked'] = pd.to_datetime(merged_final['date_liked'], errors='coerce')
merged_final = merged_final[merged_final['date_liked'].dt.day_name() == 'Friday']
merged_final.groupby(merged_final['date_liked'].dt.date).size().reset_index(name='likes')
