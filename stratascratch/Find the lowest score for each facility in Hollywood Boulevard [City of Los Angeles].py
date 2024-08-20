# Import your libraries
import pandas as pd

# Start writing code
df = los_angeles_restaurant_health_inspections[los_angeles_restaurant_health_inspections['facility_address'].str.contains('HOLLYWOOD BLVD', case=False)]
df.groupby('facility_name')['score'].min().reset_index(name = 'min_score').sort_values(
    ['min_score', 'facility_name'], ascending=[False, True])
