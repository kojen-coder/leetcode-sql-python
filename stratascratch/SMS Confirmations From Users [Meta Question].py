# Start writing code
import pandas as pd
import numpy as np

df1 = fb_sms_sends[(fb_sms_sends['type']=='message')]
df1_value = df1[df1['ds']=='2020-08-04'].count().iloc[0]
df2 = df1.merge(fb_confirmers, left_on=['ds', 'phone_number'], right_on=['date', 'phone_number'], how='left')
df2 = df2[df2['date']=='2020-08-04']
df2_value = df2.count().iloc[0]
pd.DataFrame({'count': [df2_value / df1_value * 100]})
