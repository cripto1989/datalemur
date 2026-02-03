SELECT 
    e.user_id
FROM emails e 
INNER JOIN texts t ON e.email_id = t.email_id
WHERE e.signup_date + INTERVAL '1 days' = t.action_date AND t.signup_action = 'Confirmed';