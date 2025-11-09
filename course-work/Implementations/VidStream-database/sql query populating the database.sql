
PRINT '';
PRINT 'Populating database with sample data...';
PRINT '';

-- Insert Users
INSERT INTO [User] (username, email, password_hash, created_at)
VALUES 
    ('john_doe', 'john@example.com', 'hashed_password_123', '2024-01-15 10:30:00'),
    ('jane_smith', 'jane@example.com', 'hashed_password_456', '2024-02-20 14:45:00'),
    ('mike_wilson', 'mike@example.com', 'hashed_password_789', '2024-03-10 09:15:00'),
    ('sarah_johnson', 'sarah@example.com', 'hashed_password_abc', '2024-04-05 16:20:00'),
    ('alex_brown', 'alex@example.com', 'hashed_password_def', '2024-05-12 11:00:00');
GO

-- Insert Categories
INSERT INTO Category (name, description)
VALUES 
    ('Gaming', 'Video games, gameplay, and reviews'),
    ('Music', 'Music videos, covers, and tutorials'),
    ('Education', 'Educational content and tutorials'),
    ('Vlog', 'Personal vlogs and daily life'),
    ('Technology', 'Tech reviews and news'),
    ('Cooking', 'Recipes and cooking tutorials');
GO

-- Insert Channels
INSERT INTO Channel (user_id, name, description, created_at)
VALUES 
    (1, 'JohnGaming', 'Pro gaming channel with daily gameplay', '2024-01-15 11:00:00'),
    (2, 'JaneMusicOfficial', 'Original music and covers', '2024-02-20 15:00:00'),
    (3, 'TechWithMike', 'Latest tech reviews and tutorials', '2024-03-10 10:00:00'),
    (4, 'SarahCooks', 'Easy and delicious recipes', '2024-04-05 17:00:00'),
    (5, 'AlexVlogs', 'Daily life adventures', '2024-05-12 12:00:00');
GO

-- Insert Videos
INSERT INTO Video (channel_id, user_id, category_id, title, description, url, views, created_at)
VALUES 
    (1, 1, 1, 'Epic Gaming Moments Compilation', 'Best gaming moments from last month', 'https://vidstream.com/video1', 15000, '2024-06-01 10:00:00'),
    (1, 1, 1, 'How to Win in Battle Royale', 'Pro tips and strategies for victory', 'https://vidstream.com/video2', 8500, '2024-06-15 14:30:00'),
    (2, 2, 2, 'Acoustic Guitar Cover - Amazing Song', 'My favorite song cover on acoustic guitar', 'https://vidstream.com/video3', 12000, '2024-06-20 16:45:00'),
    (2, 2, 2, 'Original Song: Dreams', 'My first original composition', 'https://vidstream.com/video4', 5000, '2024-07-01 11:20:00'),
    (3, 3, 5, 'iPhone 16 Pro Review', 'Complete review of the new iPhone', 'https://vidstream.com/video5', 25000, '2024-07-05 09:00:00'),
    (3, 3, 5, 'Best Budget Laptops 2024', 'Top 5 affordable laptops for students', 'https://vidstream.com/video6', 18000, '2024-07-10 13:15:00'),
    (4, 4, 6, 'Easy Chocolate Cake Recipe', 'Step by step chocolate cake tutorial', 'https://vidstream.com/video7', 9500, '2024-07-15 10:30:00'),
    (4, 4, 6, 'Healthy Breakfast Ideas', '5 quick and healthy breakfast recipes', 'https://vidstream.com/video8', 7200, '2024-07-20 08:00:00'),
    (5, 5, 4, 'Day in My Life as a Student', 'Follow me through a typical day', 'https://vidstream.com/video9', 4500, '2024-07-25 15:00:00'),
    (5, 5, 4, 'Travel Vlog: Mountain Adventure', 'Epic hiking trip to the mountains', 'https://vidstream.com/video10', 6800, '2024-08-01 12:00:00');
GO

-- Insert Comments
INSERT INTO Comment (user_id, video_id, content, timestamp)
VALUES 
    (2, 1, 'Amazing gameplay! Keep it up!', '2024-06-02 11:30:00'),
    (3, 1, 'Those moves were incredible!', '2024-06-02 14:20:00'),
    (4, 1, 'Best gaming video I have seen this week', '2024-06-03 09:15:00'),
    (1, 3, 'Beautiful cover! Love your voice', '2024-06-21 10:00:00'),
    (5, 3, 'This is so relaxing to listen to', '2024-06-21 18:30:00'),
    (2, 5, 'Very detailed review, thanks!', '2024-07-06 10:45:00'),
    (4, 5, 'Helped me decide which phone to buy', '2024-07-06 15:20:00'),
    (1, 7, 'Trying this recipe tonight!', '2024-07-16 11:00:00'),
    (3, 7, 'Looks delicious, thanks for sharing', '2024-07-16 16:30:00'),
    (5, 9, 'Very relatable content!', '2024-07-26 09:00:00'),
    (2, 10, 'Beautiful scenery! Where is this?', '2024-08-02 14:00:00'),
    (4, 10, 'I want to visit this place now', '2024-08-02 17:45:00');
GO

-- Insert Likes
INSERT INTO [Like] (user_id, video_id, timestamp)
VALUES 
    (2, 1, '2024-06-02 11:00:00'),
    (3, 1, '2024-06-02 14:00:00'),
    (4, 1, '2024-06-03 09:00:00'),
    (5, 1, '2024-06-03 12:00:00'),
    (1, 2, '2024-06-16 10:00:00'),
    (3, 2, '2024-06-16 15:00:00'),
    (1, 3, '2024-06-21 09:30:00'),
    (4, 3, '2024-06-21 11:00:00'),
    (5, 3, '2024-06-21 18:00:00'),
    (2, 5, '2024-07-06 10:30:00'),
    (3, 5, '2024-07-06 12:00:00'),
    (4, 5, '2024-07-06 15:00:00'),
    (5, 5, '2024-07-07 09:00:00'),
    (1, 5, '2024-07-07 14:00:00'),
    (1, 7, '2024-07-16 10:45:00'),
    (3, 7, '2024-07-16 16:00:00'),
    (2, 9, '2024-07-26 08:45:00'),
    (4, 9, '2024-07-26 11:00:00'),
    (2, 10, '2024-08-02 13:45:00'),
    (4, 10, '2024-08-02 17:30:00');
GO

