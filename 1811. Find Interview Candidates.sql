with temp as(
    select contest_id, win_id,
    row_number() over(partition by win_id order by contest_id) as rnk
    from (
        select contest_id, gold_medal as win_id
        from contests
        union all
        select contest_id, silver_medal as win_id
        from contests
        union all
        select contest_id, bronze_medal as win_id
        from contests
    )a
),

temp2 as(
    select win_id as user_id from temp
    group by user_id, contest_id - rnk
    having count(*) >= 3
    union all
    select gold_medal as user_id from contests
    group by user_id
    having count(*) >= 3
)

select distinct u.name, u.mail from temp2 t
inner join users u on t.user_id = u.user_id