--====================================================
--  Channel: Ship of Learning - Meta
--  Topic: Find Facebook Pages With Zero Likes
--====================================================    

-- 1. Drop tables in dependency order
DROP TABLE IF EXISTS dbo.page_likes;
DROP TABLE IF EXISTS dbo.pages;
GO

-- 2. Create the Pages table
CREATE TABLE dbo.pages
(
    page_id   INT          NOT NULL,
    page_name VARCHAR(100) NOT NULL,

    CONSTRAINT PK_pages PRIMARY KEY (page_id)
);
GO

-- 3. Create the Page Likes table
CREATE TABLE dbo.page_likes
(
    user_id   INT      NOT NULL,
    page_id   INT      NOT NULL,
    liked_date DATETIME2(0) NOT NULL,

    CONSTRAINT PK_page_likes
        PRIMARY KEY (user_id, page_id),

    CONSTRAINT FK_page_likes_pages
        FOREIGN KEY (page_id)
        REFERENCES dbo.pages(page_id)
);
GO

-- 4. Insert Facebook Page data
INSERT INTO dbo.pages (page_id, page_name)
VALUES
    (20001, 'SQL Solutions'),
    (20045, 'Brain Exercises'),
    (20701, 'Tips for Data Analysts');
GO

-- 5. Insert Like records
INSERT INTO dbo.page_likes (user_id, page_id, liked_date)
VALUES
    (111, 20001, '2022-04-08T00:00:00'),
    (121, 20045, '2022-03-12T00:00:00'),
    (156, 20001, '2022-07-25T00:00:00');
GO

-- 6. Inspect the master data
SELECT page_id, page_name
FROM dbo.pages
ORDER BY page_id;

SELECT user_id, page_id, liked_date
FROM dbo.page_likes
ORDER BY page_id, user_id;
GO

