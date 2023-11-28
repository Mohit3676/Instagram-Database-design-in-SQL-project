CREATE DATABASE Instagram;
USE Instagram;

-- User Entity
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Full_Name VARCHAR(255),
    Bio TEXT,
    Registration_Date DATE NOT NULL
);

-- Post Entity
CREATE TABLE Post (
    PostID INT PRIMARY KEY,
    UserID INT,
    Caption TEXT,
    Image_URL VARCHAR(255),
    Location VARCHAR(255),
    Post_Date DATE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Comment Entity
CREATE TABLE Comment (
    CommentID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    Text TEXT,
    Comment_Date DATE NOT NULL,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Like Entity
CREATE TABLE Likes (
    LikeID INT PRIMARY KEY,
    PostID INT,
    UserID INT,
    Like_Date DATE NOT NULL,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Follower Entity
CREATE TABLE Follower (
    FollowerID INT PRIMARY KEY,
    FollowingUserID INT,
    FollowerUserID INT,
    Follow_Date DATE NOT NULL,
    FOREIGN KEY (FollowingUserID) REFERENCES User(UserID),
    FOREIGN KEY (FollowerUserID) REFERENCES User(UserID)
);

-- Hashtag Entity
CREATE TABLE Hashtag (
    HashtagID INT PRIMARY KEY,
    Tag VARCHAR(255) NOT NULL
);

-- PostHashtag Entity
CREATE TABLE PostHashtag (
    PostHashtagID INT PRIMARY KEY,
    PostID INT,
    HashtagID INT,
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (HashtagID) REFERENCES Hashtag(HashtagID)
);
