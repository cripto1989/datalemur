WITH query AS (SELECT
    CASE 
        WHEN device_type = 'laptop' THEN 1 
        ELSE 0 
    END AS laptop_views,
    CASE 
        WHEN device_type IN ('tablet',
        'phone') THEN 1 
        ELSE 0 
    END AS mobile_views 
FROM
    viewership)  SELECT
    SUM(query.laptop_views) laptop_views,
    SUM(query.mobile_views) mobile_views  
FROM
    query;