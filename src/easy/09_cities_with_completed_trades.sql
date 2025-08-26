SELECT
    u.city,
    COUNT(*)  
FROM
    trades t 
INNER JOIN
    users u 
        ON t.user_id = u.user_id 
WHERE
    t.status = 'Completed' 
GROUP BY
    u.city 
ORDER BY
    2 DESC LIMIT 3;