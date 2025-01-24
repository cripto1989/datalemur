SELECT
    t.tweets as tweet_bucket,
    count(*) as users_num      
FROM
    (SELECT
        user_id,
        count(*) as tweets          
    FROM
        tweets          
    WHERE
        tweet_date between '2022-01-01' and '2022-12-31'          
    GROUP BY
        user_id) as t      
GROUP BY
    t.tweets;