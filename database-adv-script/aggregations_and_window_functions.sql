-- 1.Aggregation: Total number of bookings made by each user
SELECT 
    u.user_id,
    u.full_name,
    COUNT(b.booking_id) AS total_bookings
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_bookings DESC;

-- 2. Window Function: Rank properties by total number of bookings
SELECT 
    p.property_id,
    p.title,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM properties AS p
LEFT JOIN bookings AS b
    ON p.property_id = b.property_id
GROUP BY p.property_id, p.title
ORDER BY property_rank;
