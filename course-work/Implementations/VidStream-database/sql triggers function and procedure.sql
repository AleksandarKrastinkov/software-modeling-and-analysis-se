CREATE PROCEDURE sp_AddVideo
    @channel_id INT,
    @user_id INT,
    @category_id INT,
    @title VARCHAR(255),
    @description VARCHAR(MAX),
    @url VARCHAR(500)
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Validate that user owns the channel
    IF NOT EXISTS (SELECT 1 FROM Channel WHERE channel_id = @channel_id AND user_id = @user_id)
    BEGIN
        RAISERROR('User does not own this channel', 16, 1);
        RETURN;
    END
    
    -- Validate category exists
    IF NOT EXISTS (SELECT 1 FROM Category WHERE category_id = @category_id)
    BEGIN
        RAISERROR('Invalid category', 16, 1);
        RETURN;
    END
    
    -- Validate title length
    IF LEN(@title) < 3
    BEGIN
        RAISERROR('Title must be at least 3 characters', 16, 1);
        RETURN;
    END
    
    -- Insert the video
    INSERT INTO Video (channel_id, user_id, category_id, title, description, url, views, created_at)
    VALUES (@channel_id, @user_id, @category_id, @title, @description, @url, 0, GETDATE());
    
    -- Return the new video ID
    SELECT SCOPE_IDENTITY() AS NewVideoID;
END;
GO


CREATE FUNCTION fn_GetVideoLikeCount(@video_id INT)
RETURNS INT
AS
BEGIN
    DECLARE @like_count INT;
    
    SELECT @like_count = COUNT(*)
    FROM [Like]
    WHERE video_id = @video_id;
    
    RETURN @like_count;
END;
GO


CREATE TRIGGER tr_ValidateCommentContent
ON Comment
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check for empty or whitespace-only comments
    IF EXISTS (SELECT 1 FROM inserted WHERE LEN(LTRIM(RTRIM(content))) < 1)
    BEGIN
        RAISERROR('Comment cannot be empty or contain only whitespace', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    -- Check for minimum comment length (at least 2 characters)
    IF EXISTS (SELECT 1 FROM inserted WHERE LEN(content) < 2)
    BEGIN
        RAISERROR('Comment must be at least 2 characters long', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
    
    -- Check for maximum comment length (10000 characters)
    IF EXISTS (SELECT 1 FROM inserted WHERE LEN(content) > 10000)
    BEGIN
        RAISERROR('Comment cannot exceed 10000 characters', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO

