/* Select earliest Date an user joined */
SELECT date_format(created_at, '%b %D %Y') AS earliest_date 
FROM users
ORDER BY created_at
LIMIT 1;

/* Select email of earliest user */
SELECT * FROM users
ORDER BY created_at
LIMIT 1;

/* Users grouped by month */
SELECT date_format(created_at, '%M') AS 'Month', 
COUNT(*) AS 'Count' 
FROM users
GROUP BY date_format(created_at, '%M');

/* Count number of users with yahoo email */
SELECT COUNT(*) FROM users
WHERE email LIKE '%yahoo.com';

/* Users for each email host */
SELECT 
	RIGHT(email, (length(email)-LOCATE('@', email))) as provider, 
	COUNT(*) AS Count
FROM users
GROUP BY provider;

SELECT
	CASE
		WHEN email LIKE '%@gmail.com' THEN 'gmail'
        WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'other'
	END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider;


