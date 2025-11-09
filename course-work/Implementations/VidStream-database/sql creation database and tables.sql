
USE master;
GO

-- Drop database if exists (for clean recreation)
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'VidStream')
BEGIN
    ALTER DATABASE VidStream SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE VidStream;
END
GO

-- Create the VidStream database
CREATE DATABASE VidStream;
GO

-- Use the newly created database
USE VidStream;
GO

-- =============================================
-- Create Tables
-- =============================================

-- Table: User
-- Stores user account information
CREATE TABLE [User] (
    user_id INT IDENTITY(1,1) NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NULL,
    password_hash VARCHAR(255) NOT NULL, -- Increased for secure password hashing
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT PK_User PRIMARY KEY (user_id),
    CONSTRAINT UQ_User_Username UNIQUE (username),
    CONSTRAINT UQ_User_Email UNIQUE (email),
    CONSTRAINT CK_User_Email CHECK (email LIKE '%@%.%' OR email IS NULL)
);
GO

-- Table: Category
-- Stores video categories
CREATE TABLE Category (
    category_id INT IDENTITY(1,1) NOT NULL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NULL,
    
    CONSTRAINT PK_Category PRIMARY KEY (category_id),
    CONSTRAINT UQ_Category_Name UNIQUE (name)
);
GO

-- Table: Channel
-- Stores channels owned by users
CREATE TABLE Channel (
    channel_id INT IDENTITY(1,1) NOT NULL,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL, -- Increased from 10 for practical use
    description VARCHAR(500) NULL,
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT PK_Channel PRIMARY KEY (channel_id),
    CONSTRAINT FK_Channel_User FOREIGN KEY (user_id) 
        REFERENCES [User](user_id) ON DELETE CASCADE,
    CONSTRAINT UQ_Channel_Name UNIQUE (name)
);
GO

-- Table: Video
-- Stores video information
CREATE TABLE Video (
    video_id INT IDENTITY(1,1) NOT NULL,
    channel_id INT NOT NULL,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NULL,
    url VARCHAR(500) NOT NULL,
    views INT NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT PK_Video PRIMARY KEY (video_id),
    CONSTRAINT FK_Video_Channel FOREIGN KEY (channel_id) 
        REFERENCES Channel(channel_id) ON DELETE CASCADE,
    CONSTRAINT FK_Video_User FOREIGN KEY (user_id) 
        REFERENCES [User](user_id) ON DELETE NO ACTION,
    CONSTRAINT FK_Video_Category FOREIGN KEY (category_id) 
        REFERENCES Category(category_id) ON DELETE NO ACTION,
    CONSTRAINT CK_Video_Views CHECK (views >= 0),
    CONSTRAINT CK_Video_URL CHECK (LEN(url) > 0)
);
GO

-- Table: Comment
-- Stores comments on videos
CREATE TABLE Comment (
    comment_id INT IDENTITY(1,1) NOT NULL,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    content VARCHAR(MAX) NOT NULL,
    timestamp DATETIME NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT PK_Comment PRIMARY KEY (comment_id),
    CONSTRAINT FK_Comment_User FOREIGN KEY (user_id) 
        REFERENCES [User](user_id) ON DELETE NO ACTION,
    CONSTRAINT FK_Comment_Video FOREIGN KEY (video_id) 
        REFERENCES Video(video_id) ON DELETE CASCADE,
    CONSTRAINT CK_Comment_Content CHECK (LEN(content) > 0)
);
GO

-- Table: Like
-- Stores likes on videos
CREATE TABLE [Like] (
    like_id INT IDENTITY(1,1) NOT NULL,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    timestamp DATETIME NOT NULL DEFAULT GETDATE(),
    
    CONSTRAINT PK_Like PRIMARY KEY (like_id),
    CONSTRAINT FK_Like_User FOREIGN KEY (user_id) 
        REFERENCES [User](user_id) ON DELETE NO ACTION,
    CONSTRAINT FK_Like_Video FOREIGN KEY (video_id) 
        REFERENCES Video(video_id) ON DELETE CASCADE,
    CONSTRAINT UQ_Like_UserVideo UNIQUE (user_id, video_id) -- One like per user per video
);
GO

