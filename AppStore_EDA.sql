SELECT *
FROM AppleStore;

SELECT *
FROM appleStore_description;

--Checking any missing values
SELECT COUNT(*)
FROM AppleStore
WHERE id IS NULL OR track_name IS NULL OR prime_genre IS NULL;

--Data Analysis

--COUNTING APPS
SELECT COUNT(id)
FROM AppleStore;

SELECT COUNT(id)
FROM appleStore_description;

--COUNT OF PAID APPS
SELECT COUNT(id)
FROM AppleStore
WHERE price > 0;

--COUNT OF FREE APPS
SELECT COUNT(id)
FROM AppleStore
WHERE price = 0;

--MAX, MIN AND AVERAGE APP PRICE
SELECT
	ROUND(MAX(price),2) as maximum_price,
	ROUND(MIN(price),2) as minimum_price,
	ROUND(AVG(price),2) as average_price
FROM AppleStore
WHERE price > 0;

--GENRE DISTRIBUTION BY COUNT
SELECT
	prime_genre,
	COUNT(prime_genre) AS genre_amount
FROM AppleStore
GROUP BY prime_genre
ORDER BY genre_amount DESC;

--MIN, MAX AND AVG rating
SELECT 
	MAX(user_rating) AS max_rating,
	MIN(user_rating) AS min_rating,
	ROUND(AVG(user_rating),2) AS average_rating
FROM AppleStore;

--AVERAGE RATING OF GENRES
SELECT
	prime_genre,
	ROUND(AVG(user_rating),2) AS average_rating
FROM
	AppleStore
GROUP BY
	prime_genre
ORDER BY
	average_rating DESC;

--RATING OF FREE & PAID APPS
SELECT 
	CASE
		WHEN price > 0 THEN 'Paid Apps'
		ELSE 'Free Apps' END AS app_type,
	ROUND(AVG(user_rating),2) AS average_rating
FROM
	AppleStore
GROUP BY
	CASE
		WHEN price > 0 THEN 'Paid Apps'
		ELSE 'Free Apps'
		END;

--RATING ACCORDING TO LANGUAGE DIVERSITY
SELECT 
	ROUND(AVG(user_rating),2) AS average_rating,
	CASE 
		WHEN lang_num < 10 THEN '< 10 languages'
		WHEN lang_num > 20 THEN '> 20 languages'
		ELSE '10-20 languages' 
	END AS language_diversity
FROM
	AppleStore
GROUP BY
	CASE 
		WHEN lang_num < 10 THEN '< 10 languages'
		WHEN lang_num > 20 THEN '> 20 languages'
		ELSE '10-20 languages' 
	END;

--RELEVATION OF DESCRIPTION LENGTH WITH USER RATING
SELECT
	CASE 
		WHEN LEN(ad.app_desc) < 100 THEN 'Short'
		WHEN LEN(ad.app_desc) > 400 THEN 'Long'
		ELSE 'Medium' END AS desc_length,
		ROUND(AVG(a.user_rating),2) AS average_rating
FROM AppleStore AS a
JOIN appleStore_description AS ad ON a.id = ad.id
GROUP BY
	CASE 
		WHEN LEN(ad.app_desc) < 100 THEN 'Short'
		WHEN LEN(ad.app_desc) > 400 THEN 'Long'
		ELSE 'Medium' END
ORDER BY average_rating DESC;

--TOP 10 RATED APPS
SELECT TOP 10
	track_name,
	prime_genre,
	user_rating
FROM
	AppleStore
ORDER BY
	user_rating DESC;

--BOTTOM 10 RATED APPS
SELECT TOP 10
	track_name,
	prime_genre,
	user_rating
FROM
	AppleStore
ORDER BY
	user_rating ASC;