# Files

1.`joins_queries.sql` — contains three SQL queries using:
  - INNER JOIN (Bookings ↔ Users)
  - LEFT JOIN (Properties ↔ Reviews)
  - FULL OUTER JOIN (Users ↔ Bookings)


## Description
These queries show how to combine relational data efficiently:
- **INNER JOIN** returns only bookings linked to an existing user.
- **LEFT JOIN** lists all properties, even those without any review.
- **FULL OUTER JOIN** merges users and bookings, showing all records from both sides.

2. `subqueries.sql`

   ### Description

- **Non-Correlated Subquery:**  
  Retrieves properties whose **average rating is greater than 4.0**, calculated independently from the main query.

- **Correlated Subquery:**  
  Finds users who have made **more than 3 bookings**, where the subquery depends on each user record from the outer query.


