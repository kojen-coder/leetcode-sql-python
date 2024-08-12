# Import your libraries
import pandas as pd

# Start writing code
cities_population['density'] = cities_population['population'] / cities_population['area']
cities_population[
    (cities_population['density'] == cities_population['density'].max()) |
    (cities_population['density'] == cities_population['density'].min())][['city', 'country', 'density']]
