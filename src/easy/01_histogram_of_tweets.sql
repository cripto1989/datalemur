SELECT
    t.tweets as tweet_bucket,
    COUNT(*) as users_num      
FROM
    (SELECT
        user_id,
        COUNT(*) as tweets          
    FROM
        tweets          
    WHERE        
        EXTRACT(YEAR FROM tweet_date) = 2022          
    GROUP BY
        user_id) AS t      
GROUP BY
    t.tweets;