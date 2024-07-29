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

# Preferred Solution: Using recursion to solve this problem
def factorial(n):
  if n == 0 or n == 1:
    return 1
  else:
    return n*factorial(n-1)