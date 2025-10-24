# ERD: Airbnb Database — Entities and Relationships

## 1. Entities and Attributes

### USER
- **user_id:** Primary Key, UUID, Indexed
- **first_name:** VARCHAR, NOT NULL
- **last_name:** VARCHAR, NOT NULL
- **email:** VARCHAR, UNIQUE, NOT NULL
- **password_hash:** VARCHAR, NOT NULL
- **phone_number:** VARCHAR, NULL
- **role:** ENUM (guest, host, admin), NOT NULL
- **created_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### PROPERTY
- **property_id:** Primary Key, UUID, Indexed
- **host_id:** Foreign Key, references User(user_id)
- **name:** VARCHAR, NOT NULL
- **description:** TEXT, NOT NULL
- **location:** VARCHAR, NOT NULL
- **pricepernight:** DECIMAL, NOT NULL
- **created_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **updated_at:** TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### BOOKING
- **booking_id:** Primary Key, UUID, Indexed
- **property_id:** Foreign Key, references Property(property_id)
- **user_id:** Foreign Key, references User(user_id)
- **start_date:** DATE, NOT NULL
- **end_date:** DATE, NOT NULL
- **total_price:** DECIMAL, NOT NULL
- **status:** ENUM (pending, confirmed, canceled), NOT NULL
- **created_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### PAYMENT
- **payment_id:** Primary Key, UUID, Indexed
- **booking_id:** Foreign Key ,references Booking(booking_id)
- **amount:** DECIMAL, NOT NULL
- **payment_date:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **payment_method:** ENUM (credit_card, paypal, stripe), NOT NULL

### REVIEW
- **review_id:** Primary Key, UUID, Indexed
- **property_id:** Foreign Key, references Property(property_id)
- **user_id:** Foreign Key, references User(user_id)
- **rating:** INTEGER, NOT NULL, CHECK (rating >= 1 AND rating <= 5)
- **comment:** TEXT, NOT NULL
- **created_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### MESSAGE
- **message_id:** Primary Key, UUID, Indexed
- **sender_id:** Foreign Key, references User(user_id)
- **recipient_id:** Foreign Key, references User(user_id)
- **message_body:** TEXT, NOT NULL
- **sent_at:** TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## 2. Constraints and Indexes 
- **User Table**: unique constraint on `email`. Non-null constraints applied to required fields.
- **Property Table**: `host_id` FK → users(user_id); non-null for required fields (name, location, pricepernight).
- **Booking Table**: `property_id` FK → properties(property_id); `user_id` FK → users(user_id); `status` constrained to (pending, confirmed, canceled); `end_date > start_date` check recommended.
- **Payment Table**: `booking_id` FK → bookings(booking_id).
- **Review Table**: rating check (1 - 5); `property_id`, `user_id` foreign keys.
- **Message Table**: `sender_id` and `recipient_id` foreign keys reference users.

**Indexes recommended**: `email` (users), `property_id` (properties and bookings), `booking_id` (bookings and payments).

---

## 3. Relationships
- **User → Property (host):** User **0..*** Property **1**  
  - Meaning: a user may have 0 or many properties; each property must belong to exactly one host.
- **User → Booking (guest):** User **0..*** Booking **1**  
  - Meaning: a user may have 0 or many bookings; each booking must belong to one user.
- **Property → Booking:** Property **0..*** Booking **1**  
  - Meaning: a property may have 0 or many bookings; each booking is for one property.
- **Booking → Payment:** Booking **1** Payment **0..1**  
  - Meaning: a booking may have zero or one payment (payment can occur later).
- **Property → Review:** Property **0..*** Review **1**  
  - Meaning: a property may have 0 or many reviews; each review belongs to one property.
- **User → Review:** User **0..*** Review **1**  
  - Meaning: a user may write 0 or many reviews; each review belongs to one user.
- **User → Message:** User **0..*** Message **1** (for sender) and User **0..*** Message **1** (for recipient)  
  - Meaning: a user may send and receive many messages; each message has exactly one sender and one recipient.

---

## 4. Diagram file
Diagram image: `ERD/datascape-erd.png` (exported from Draw.io, crow’s-foot notation and labels included).


