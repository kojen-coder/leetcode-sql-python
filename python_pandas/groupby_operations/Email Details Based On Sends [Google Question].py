# Import your libraries
import pandas as pd

# Start writing code
df = google_gmail_emails.groupby('day').agg(receivers=('to_user', 'nunique'), senders=('from_user', 'nunique')).reset_index()
selected_days = df[df['receivers'] > df['senders']]['day']
google_gmail_emails[google_gmail_emails['day'].isin(selected_days)]
