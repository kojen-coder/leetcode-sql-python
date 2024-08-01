# Import your libraries
import pandas as pd

# Start writing code
forbes_global_2010_2014.sort_values('profits', ascending = False).reset_index()[['company', 'profits']].head(3)