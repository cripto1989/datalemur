SELECT sender_id, COUNT(*) as count_messages
FROM messages 
WHERE EXTRACT(YEAR FROM sent_date) = 2022 
AND EXTRACT(MONTH FROM sent_date) = 08 
GROUP BY sender_id ORDER BY 2 DESC LIMIT 2;