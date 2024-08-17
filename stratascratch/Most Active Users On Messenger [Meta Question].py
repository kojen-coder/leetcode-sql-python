# Import your libraries
import pandas as pd

# Start writing code
df_concat = pd.concat(
    [
        fb_messages[["user1", "msg_count"]],
        fb_messages[["user2", "msg_count"]].rename(columns={"user2": "user1"})
    ],
    axis=0
)
df_concat.groupby('user1')['msg_count'].sum().reset_index().sort_values('msg_count', ascending=False).iloc[:10]
