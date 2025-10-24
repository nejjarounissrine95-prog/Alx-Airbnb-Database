# Airbnb Database Normalization

## Objective
Ensure the Airbnb database schema is in Third Normal Form (3NF) to reduce redundancy and improve data integrity.

## 1NF – First Normal Form
- All tables have atomic values (no multi-valued attributes).
- Each record is unique with a primary key.
- User, Property, Booking, Payment, Review, and Message tables meet 1NF.

## 2NF – Second Normal Form
- Already in 1NF.
- All non-key attributes fully depend on the primary key.
- No partial dependencies exist in any table.

## 3NF – Third Normal Form
- Already in 2NF.
- No transitive dependencies exist (non-key attributes depending on other non-key attributes).
- All tables comply with 3NF.

## Table Review

### User
- `user_id` is primary key; all attributes depend only on `user_id`.

### Property
- `property_id` is primary key; attributes depend on `property_id`.
- `host_id` is a foreign key referencing User.

### Booking
- `booking_id` is primary key; attributes depend on `booking_id`.
- `property_id` and `user_id` are foreign keys.

### Payment
- `payment_id` is primary key; depends only on `payment_id`.
- `booking_id` is foreign key.

### Review
- `review_id` is primary key; depends only on `review_id`.
- `property_id` and `user_id` are foreign keys.

### Message
- `message_id` is primary key; depends only on `message_id`.
- `sender_id` and `recipient_id` are foreign keys.

## Conclusion
The Airbnb database design satisfies 3NF. No redundancies or violations of normalization principles were found.
