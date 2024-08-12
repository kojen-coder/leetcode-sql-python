def find_window_sum(k):
    """
    :type k: int
    :rtype: List[Tuple[int, int]]
    """
    results = []
    start = 1
    current_sum = 0

    for end in range ( 1, k + 1 ):
        current_sum += end

        while current_sum > k and start <= end:
            current_sum -= start
            start += 1

        if current_sum == k and end > start:
            results.append ( [start, end] )

    return results

