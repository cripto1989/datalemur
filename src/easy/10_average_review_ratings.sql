SELECT
    EXTRACT(MONTH 
FROM
    submit_date) AS mth,
    product_id AS product,
    ROUND(AVG(stars),
    2) AS avg_starts 
FROM
    reviews 
GROUP BY
    mth,
    product_id 
ORDER BY
    1,
    2;