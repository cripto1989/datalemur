SELECT MAX(salary) as second_highest_salary
FROM employee WHERE salary < (SELECT MAX(salary) FROM employee);

-- OR

WITH salary_ranked AS ( SELECT
    *,
    ROW_NUMBER() OVER (
ORDER BY
    salary DESC) AS rank 
FROM
    employee) SELECT
    salary AS second_highest_salary 
FROM
    salary_ranked 
WHERE
    rank=2;
