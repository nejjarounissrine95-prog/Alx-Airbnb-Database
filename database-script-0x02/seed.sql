-- seed.sql
-- Sample data for Airbnb Database
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Smith', 'alice@example.com', 'hashedpassword1', '1234567890', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword2', '0987654321', 'host'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Brown', 'charlie@example.com', 'hashedpassword3', NULL, 'guest');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Sea View Apartment', 'Beautiful apartment by the sea.', 'Miami', 150.00),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'City Loft', 'Modern loft in the city center.', 'New York', 200.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('10101010-1010-1010-1010-101010101010', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-11-01', '2025-11-05', 600.00, 'confirmed');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('55555555-5555-5555-5555-555555555555', '10101010-1010-1010-1010-101010101010', 600.00, 'credit_card');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('99999999-9999-9999-9999-999999999999', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay!');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('77777777-7777-7777-7777-777777777777', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi, I am interested in your property!');
