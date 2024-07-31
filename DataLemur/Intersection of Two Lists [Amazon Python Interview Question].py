def intersection(a, b):
    result = []
    for i in a:
        if i in b:
            result.append ( i )

    return result