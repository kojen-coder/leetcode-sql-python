def contains_duplicate(input)-> bool:
  sort = []
  for i in input:
    if i in sort:
      return True
    else:
      sort.append(i)
  return False
