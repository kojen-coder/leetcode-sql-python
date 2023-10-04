select q.id, q.year, ifnull(n.npv, 0) as npv
from queries q left join npv n on q.id=n.id and n.year=q.year
