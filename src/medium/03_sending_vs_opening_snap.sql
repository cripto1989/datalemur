WITH buckets AS (SELECT 
ab.age_bucket AS age_bucket, 
sum(
    CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0
    END
) AS send_time,
sum(
    CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0
    END
) AS open_time 
FROM activities a 
INNER JOIN age_breakdown ab ON a.user_id=ab.user_id
GROUP BY ab.age_bucket)
SELECT
    age_bucket,
    round(CAST((send_time / (send_time + open_time)) * 100.0 AS NUMERIC), 2) AS send_perc,
    round(CAST((open_time / (send_time + open_time)) * 100.0 AS NUMERIC), 2) AS open_perc
FROM buckets ORDER BY age_bucket;