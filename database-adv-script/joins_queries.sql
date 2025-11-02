# SQL Script

```sql
-- ===========================================
-- File: joins_queries.sql
-- Project: Unleashing Advanced Querying Power
-- Task 0: Write Complex Queries with Joins
-- ===========================================

-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    b.booking_id,
    u.full_name AS user_name,
    b.property_id,
    b.check_in,
    b.check_out
FROM bookings AS b
INNER JOIN users AS u
    ON b.user_id = u.user_id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews (include properties without reviews)
SELECT 
    p.property_id,
    p.title,
    r.review_id,
    r.rating
FROM properties AS p
LEFT JOIN reviews AS r
    ON p.property_id = r.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings (even if no link between them)
SELECT 
    u.user_id,
    u.full_name,
    b.booking_id,
    b.property_id
FROM users AS u
FULL OUTER JOIN bookings AS b
    ON u.user_id = b.user_id;
é
