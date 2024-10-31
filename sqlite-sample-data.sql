-- Insert sample data into users
INSERT INTO users (email, password_hash, pin, sso_provider_id, sso_provider_user_id, name, image_url, quotes, language, currency) 
VALUES 
('user1@example.com', 'hashedpassword1', '1234', NULL, NULL, 'User One', 'https://example.com/image1.jpg', 'Quote One', 'en', 'USD'),
('user2@example.com', 'hashedpassword2', '5678', NULL, NULL, 'User Two', 'https://example.com/image2.jpg', 'Quote Two', 'en', 'USD');

-- Insert sample data into sso_providers
INSERT INTO sso_providers (name, url) 
VALUES 
('Google', 'https://google.com'),
('Facebook', 'https://facebook.com');

-- Insert sample data into wallets
INSERT INTO wallets (user_id, name, amount, is_active) 
VALUES 
(1, 'Main Wallet', 5000, 1),
(1, 'Savings Wallet', 3000, 0),
(2, 'User Two Wallet', 1000, 1);

-- Insert sample data into pockets
INSERT INTO pockets (wallet_id, name, description, emoji, amount_limit) 
VALUES 
(1, 'Groceries', 'Monthly grocery budget', ':apple:', 300),
(1, 'Entertainment', 'Fun activities budget', ':party_popper:', 150),
(2, 'Travel', 'Travel expenses for the year', ':airplane:', 1200);

-- Insert sample data into pocket_records
INSERT INTO pocket_records (pocket_id, name, amount, is_expense) 
VALUES 
(1, 'Grocery Store', 250, 1),
(1, 'Farmers Market', 50, 1),
(2, 'Concert Tickets', 100, 1),
(2, 'Movie Night', 30, 1),
(3, 'Flight Booking', 500, 1);

-- Insert sample data into goals
INSERT INTO goals (wallet_id, name, description, amount, attachment_url) 
VALUES 
(1, 'New Laptop', 'Saving for a new laptop', 1000, NULL),
(2, 'Vacation', 'Saving for a trip to Europe', 2500, NULL);

-- Insert sample data into goal_records
INSERT INTO goal_records (goal_id, name, amount) 
VALUES 
(1, 'Initial Savings', 300),
(1, 'Added Savings', 200),
(2, 'First Payment', 500);

-- Insert sample data into notifications
INSERT INTO notifications (user_id, name, description, is_unread) 
VALUES 
(1, 'Budget Alert', 'You have exceeded your grocery budget.', 1),
(2, 'Goal Reminder', 'Your vacation goal is nearing completion.', 0);

