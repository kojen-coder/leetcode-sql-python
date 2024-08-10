SELECT
    EXTRACT(MONTH FROM transaction_date) AS month,
    COUNT(DISTINCT customer_id) AS customers,
    COUNT(DISTINCT transaction_id) AS transactions
FROM
    wfm_transactions
WHERE
    EXTRACT(YEAR FROM transaction_date) = 2017
    AND sales >= 5
GROUP BY
    EXTRACT(MONTH FROM transaction_date)
ORDER BY
    month;
