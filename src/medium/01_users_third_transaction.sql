WITH ranked_transactions AS ( SELECT
    user_id,
    spend,
    transaction_date,
    RANK() OVER (PARTITION 
BY
    user_id 
ORDER BY
    transaction_date) AS rank   
FROM
    transactions 
ORDER BY
    user_id ) SELECT
    user_id,
    spend,
    transaction_date 
FROM
    ranked_transactions 
WHERE
    rank = 3;
