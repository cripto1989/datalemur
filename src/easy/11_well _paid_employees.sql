SELECT
    b.employee_id,
    b.name 
FROM
    employee AS e 
JOIN
    employee b 
        ON e.employee_id=b.manager_id 
WHERE
    b.salary > e.salary;