# Import your libraries
import pandas as pd

# Start writing code
df = google_gmail_emails.merge(google_gmail_labels, left_on='id', right_on='email_id', how='inner')
df['Shopping'] = (df['label']=='Shopping').astype(int)
df['Social'] = (df['label']=='Social').astype(int)
df['Promotion'] = (df['label']=='Promotion').astype(int)
df.groupby('to_user').agg(Shopping=('Shopping', 'sum'), Social=('Social', 'sum'), Promotion=('Promotion', 'sum')).reset_index()
