with dec as (
    select
        u.country,
        sum(c.number_of_comments) as sum_of_comments,
        dense_rank() over(order by sum(c.number_of_comments) desc) as rnk_dec
    from
        fb_comments_count c inner join fb_active_users u
        on c.user_id = u.user_id
    where
        c.created_at >= '2019-12-01' and c.created_at <= '2019-12-31'
    group by
        u.country
),

jan as(
    select
        u.country,
        sum(c.number_of_comments) as sum_of_comments,
        dense_rank() over(order by sum(c.number_of_comments) desc) as rnk_jan
    from
        fb_comments_count c inner join fb_active_users u
        on c.user_id = u.user_id
    where
        c.created_at >= '2020-01-01' and c.created_at <= '2020-01-31'
    group by
        u.country
)

select j.country

from
    jan j left join dec d
    on d.country = j.country
where
    j.rnk_jan < d.rnk_dec or d.rnk_dec is null
;


