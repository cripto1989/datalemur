WITH top_products AS (SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product),
ranked AS (SELECT  
    category, 
    product,
    total_spend AS spend,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY total_spend DESC) AS rank
FROM top_products)
SELECT 
    category,
    product,
    spend
FROM ranked WHERE RANK IN (1,2);