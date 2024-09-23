select
sum(apple_count) as apple_count,
sum(orange_count) as orange_count
from(
    select
    (b.apple_count + ifnull(c.apple_count, 0)) as apple_count,
    (b.orange_count + ifnull(c.orange_count, 0)) as orange_count
    from boxes b left join chests c
    on b.chest_id = c.chest_id
) a