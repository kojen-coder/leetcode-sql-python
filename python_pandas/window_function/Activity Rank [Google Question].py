# Import your libraries
import pandas as pd

# Start writing code
df = google_gmail_emails.groupby('from_user').size().to_frame('total_emails').reset_index()
df['rank'] = df['total_emails'].rank(method='first', ascending=False)
df.sort_values(by=['rank', 'from_user'], ascending=[True, True])