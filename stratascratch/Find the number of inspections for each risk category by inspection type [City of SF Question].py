# Import your libraries
import pandas as pd

# Start writing code
sf_restaurant_health_violations['no_risk_results'] = sf_restaurant_health_violations['risk_category'].isnull().astype(int)
sf_restaurant_health_violations['low_risk_results'] = (sf_restaurant_health_violations['risk_category'] == 'Low Risk').astype(int)
sf_restaurant_health_violations['medium_risk_results'] = (sf_restaurant_health_violations['risk_category'] == 'Moderate Risk').astype(int)
sf_restaurant_health_violations['high_risk_results'] = (sf_restaurant_health_violations['risk_category'] == 'High Risk').astype(int)

df = sf_restaurant_health_violations.groupby('inspection_type').agg(no_risk_results=('no_risk_results', 'sum'), low_risk_results=('low_risk_results', 'sum'), medium_risk_results=('medium_risk_results', 'sum'), high_risk_results=('high_risk_results', 'sum')).reset_index()

df['total_inspections'] = df.loc[:, 'no_risk_results':'high_risk_results'].sum(axis = 1)
df.sort_values('total_inspections', ascending = False)
