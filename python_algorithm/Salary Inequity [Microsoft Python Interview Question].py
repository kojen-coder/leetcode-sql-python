def min_inequity(salaries, n):
    salaries.sort ()
    new = salaries[:n]
    return max ( new ) - min ( new )
