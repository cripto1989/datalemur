SELECT
    account_id,
    SUM(CASE 
        WHEN transaction_type='Deposit' THEN amount 
        ELSE 0 
    END) -     SUM(CASE 
        WHEN transaction_type='Withdrawal' THEN amount 
        ELSE 0 
    END) AS final_balance 
FROM
    transactions 
GROUP BY
    account_id;

-- OR

SELECT
    account_id,
    SUM(amount) FILTER (
WHERE
    transaction_type='Deposit') -     SUM(amount) FILTER (
WHERE
    transaction_type='Withdrawal') AS final_balance 
FROM
    transactions 
GROUP BY
    account_id;

-- OR

SELECT
    account_id,
    SUM(CASE 
        WHEN transaction_type='Deposit' THEN amount 
        ELSE -amount 
    END) as final_balance 
FROM
    transactions 
GROUP BY
    account_id;
