-- Insert sample data into users
INSERT INTO users (email, password_hash, pin, sso_provider_id, sso_provider_user_id, name, image_url, quotes, language, currency, created_at, updated_at, deleted_at) 
VALUES 
('user1@example.com', 'hashedpassword1', '1234', 1, 'user1_google', 'User One', 'https://example.com/image1.jpg', 'Quote One', 'en', 'USD', '2023-01-01 10:00:00', '2023-01-02 12:00:00', NULL),
('user2@example.com', 'hashedpassword2', '5678', 2, 'user2_facebook', 'User Two', 'https://example.com/image2.jpg', 'Quote Two', 'en', 'USD', '2023-02-01 11:00:00', '2023-02-03 15:00:00', '2023-05-01 09:00:00');

-- Insert sample data into sso_providers
INSERT INTO sso_providers (name, url, created_at, updated_at, deleted_at) 
VALUES 
('Google', 'https://google.com', '2022-01-01 08:00:00', '2022-01-05 14:00:00', NULL),
('Facebook', 'https://facebook.com', '2022-02-01 09:00:00', '2022-02-03 13:00:00', NULL);

-- Insert sample data into wallets
INSERT INTO wallets (user_id, name, amount, is_active, created_at, updated_at, deleted_at) 
VALUES 
(1, 'Main Wallet', 5000, TRUE, '2023-03-01 10:00:00', '2023-03-02 10:30:00', NULL),
(1, 'Savings Wallet', 3000, FALSE, '2023-03-05 12:00:00', '2023-03-07 14:00:00', NULL),
(2, 'User Two Wallet', 1000, TRUE, '2023-04-01 15:00:00', '2023-04-03 16:00:00', '2023-06-01 08:00:00');

-- Insert sample data into pockets
INSERT INTO pockets (wallet_id, name, description, emoji, amount_limit, created_at, updated_at, deleted_at) 
VALUES 
(1, 'Groceries', 'Monthly grocery budget', ':apple:', 300, '2023-05-01 11:00:00', '2023-05-02 11:30:00', NULL),
(1, 'Entertainment', 'Fun activities budget', ':party_popper:', 150, '2023-05-10 10:00:00', '2023-05-12 10:30:00', NULL),
(2, 'Travel', 'Travel expenses for the year', ':airplane:', 1200, '2023-06-01 09:00:00', '2023-06-03 12:00:00', NULL);

-- Insert sample data into pocket_records
INSERT INTO pocket_records (pocket_id, name, amount, is_expense, created_at, updated_at, deleted_at) 
VALUES 
(1, 'Grocery Store', 250, TRUE, '2023-07-01 14:00:00', '2023-07-02 14:30:00', NULL),
(1, 'Farmers Market', 50, TRUE, '2023-07-10 12:00:00', '2023-07-12 13:00:00', NULL),
(2, 'Concert Tickets', 100, TRUE, '2023-08-01 16:00:00', '2023-08-03 16:30:00', NULL),
(2, 'Movie Night', 30, TRUE, '2023-08-05 18:00:00', '2023-08-06 18:30:00', NULL),
(3, 'Flight Booking', 500, TRUE, '2023-09-01 10:00:00', '2023-09-02 11:00:00', NULL);

-- Insert sample data into goals
INSERT INTO goals (wallet_id, name, description, amount, attachment_url, created_at, updated_at, deleted_at) 
VALUES 
(1, 'New Laptop', 'Saving for a new laptop', 1000, 'https://example.com/laptop.jpg', '2023-10-01 12:00:00', '2023-10-05 13:00:00', NULL),
(2, 'Vacation', 'Saving for a trip to Europe', 2500, 'https://example.com/vacation.jpg', '2023-11-01 09:00:00', '2023-11-04 10:00:00', NULL);

-- Insert sample data into goal_records
INSERT INTO goal_records (goal_id, name, amount, created_at, updated_at, deleted_at) 
VALUES 
(1, 'Initial Savings', 300, '2023-12-01 08:00:00', '2023-12-02 08:30:00', NULL),
(1, 'Added Savings', 200, '2024-01-01 10:00:00', '2024-01-02 10:30:00', NULL),
(2, 'First Payment', 500, '2024-02-01 11:00:00', '2024-02-03 12:00:00', NULL);

-- Insert sample data into notifications
INSERT INTO notifications (user_id, name, description, is_unread, created_at, updated_at, deleted_at) 
VALUES 
(1, 'Budget Alert', 'You have exceeded your grocery budget.', TRUE, '2024-03-01 15:00:00', '2024-03-02 16:00:00', NULL),
(2, 'Goal Reminder', 'Your vacation goal is nearing completion.', FALSE, '2024-04-01 17:00:00', '2024-04-05 17:30:00', NULL);
