WITH ranked_employees AS (SELECT
    d.department_name AS department_name,
    e.name AS name,
    e.salary AS salary,    
    dense_rank() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS ranked
FROM employee e 
INNER JOIN department d ON e.department_id = d.department_id)
SELECT 
    department_name,
    name,
    salary
FROM ranked_employees
WHERE ranked IN (1,2,3) ORDER BY 1, 3 DESC, 2;

