#  Write Complex Queries with Joins

## Overview
This file contains SQL examples that demonstrate the three join types:
- INNER JOIN
- LEFT JOIN
- FULL OUTER JOIN

These queries are written for PostgreSQL and assume the canonical Airbnb schema stored in `schema.sql` (UUID primary keys, foreign keys, constraints).

## Files
- `joins_queries.sql` — contains the SQL queries for INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.

## Queries & Purpose

### 1) INNER JOIN : Bookings with Users
**Purpose:** Retrieve all bookings and the users who made them.  
**Behavior:** Returns only bookings where a matching user exists.

Key columns returned:
- Booking details: `booking_id`, `property_id`, `start_date`, `end_date`, `total_price`, `status`
- User details: `user_id`, `user_full_name`, `user_email`

## 2) LEFT JOIN : Properties with Reviews

**Purpose:**  
Retrieve all properties and their reviews, including properties that have no reviews.

**Behavior:**  
All properties are returned; review columns are `NULL` where no review exists.

**Key columns returned:**
- Property details: `property_id`, `property_name`, `location`, `pricepernight`
- Review details: `review_id`, `reviewer_id`, `rating`, `comment`, `review_created_at`


## 3) FULL OUTER JOIN : Users and Bookings

**Purpose:**  
Retrieve every user and every booking, including users without bookings and bookings without linked users (orphan bookings).

**Behavior:**  
Combines all rows from both tables; unmatched columns will be `NULL`.


