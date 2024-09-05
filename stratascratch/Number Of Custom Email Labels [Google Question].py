# Import your libraries
import pandas as pd

# Start writing code
labels_df = google_gmail_labels[google_gmail_labels['label'].str.contains('Custom')]
df = google_gmail_emails.merge(labels_df, left_on='id', right_on='email_id', how='inner')
df.groupby(['to_user', 'label']).size().reset_index(name='n_occurrence')

