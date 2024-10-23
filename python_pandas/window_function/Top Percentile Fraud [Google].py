# Import your libraries
import pandas as pd

# Start writing code
fraud_score["percentile"] = fraud_score.groupby('state')['fraud_score'].rank(pct=True)
df = fraud_score[fraud_score["percentile"]> 0.95]
df[['policy_num', 'state','claim_cost','fraud_score']]