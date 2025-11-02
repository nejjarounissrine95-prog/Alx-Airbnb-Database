-- ===========================================
-- File: aggregations_and_window_functions.sql
-- Project: Unleashing Advanced Querying Power
-- Task 2: Apply Aggregations and Window Functions
-- ===========================================

-- 1️⃣ Aggregation: Total number of bookings made by each user
SELECT 
    u.user_id,
    u.full_name,
    COUNT(b.booking_id) AS total_bookings
FROM users AS u
LEFT JOIN bookings AS b
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_bookings DESC;

-- 2️⃣ Window Functions: Rank properties by total number of bookings
WITH property_totals AS (
    SELECT
        p.property_id,
        p.title,
        COUNT(b.booking_id) AS total_bookings
    FROM properties AS p
    LEFT JOIN bookings AS b
        ON p.property_id = b.property_id
    GROUP BY p.property_id, p.title
)
SELECT
    property_id,
    title,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS property_rank,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC, property_id) AS property_row_number
FROM property_totals
ORDER BY total_bookings DESC;
