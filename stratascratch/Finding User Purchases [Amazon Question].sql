WITH ranked_purchases AS (
    SELECT
        user_id,
        created_at,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY created_at) AS purchase_rank
    FROM amazon_transactions
),
second_purchases AS (
    SELECT
        p1.user_id
    FROM
        ranked_purchases p1
    JOIN
        ranked_purchases p2 ON p1.user_id = p2.user_id AND p1.purchase_rank < p2.purchase_rank
    WHERE
        p2.created_at <= p1.created_at + INTERVAL '7' DAY
)

SELECT
    user_id
FROM
    second_purchases
GROUP BY
    user_id;
