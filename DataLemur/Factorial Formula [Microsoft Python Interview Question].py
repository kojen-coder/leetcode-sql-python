def factorial(n):
    i = 0
    result = 1

    while i < n:
        if n - i <= 1:
            break
        else:
            result *= (n - i)
            i += 1

    return result
