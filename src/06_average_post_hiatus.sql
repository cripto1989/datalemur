SELECT
    user_id,
    MAX(post_date::DATE) - MIN(post_date::DATE) 
FROM
    posts  
WHERE
    EXTRACT(year 
FROM
    post_date) = 2021 
GROUP BY
    user_id 
HAVING
    count(*) > 1;