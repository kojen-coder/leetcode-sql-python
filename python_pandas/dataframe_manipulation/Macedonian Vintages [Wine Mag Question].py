# Import your libraries
import pandas as pd

macedonia = winemag_p2[winemag_p2['country'] == 'Macedonia']
macedonia['year'] = (macedonia['title'].str.extract('(\d{4,4})')).astype(int)
result = macedonia [['title','year']]