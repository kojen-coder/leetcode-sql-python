def find_pairs(input):
    k = input["k"]
    arr = input["arr"]

    count = {}
    results = set ()

    for num in arr:
        count[num] = count.get ( num, 0 ) + 1

    for num in arr:
        if (num + k) in count and (num, num + k) not in results and (num + k, num) not in results:
            results.add ( (num, num + k) )
        if (num - k) in count and (num, num - k) not in results and (num - k, num) not in results:
            results.add ( (num, num - k) )

    return list ( results )