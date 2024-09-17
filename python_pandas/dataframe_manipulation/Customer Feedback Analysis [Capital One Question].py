# Import your libraries
import pandas as pd

# Start writing code
customer_feedback[(customer_feedback['source_channel'] == 'social_media') &
                (customer_feedback['comment_category'] != 'short_comments')][['feedback_id', 'feedback_text', 'source_channel', 'comment_category']].drop_duplicates()