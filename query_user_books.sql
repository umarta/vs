DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    ID serial PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Books (
    ID serial PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Date DATE NOT NULL,
    user_id INT REFERENCES Users(ID) ON DELETE CASCADE
);


-- Users Table
INSERT INTO Users (Name) VALUES
    ('John'),
    ('Bob'),
    ('Britany');

-- Books Table
INSERT INTO Books (Name, Date, user_id) VALUES
    ('Bachelor of Information Systems', '2019-01-01', 1),
    ('Bachelor of Design', '2019-02-02', 2),
    ('Bachelor of Commerce', '2019-03-03', 3),
    ('Associate Degree in Health Science', '2019-04-04', 3),
    ('Master of Architectural Technology', '2019-05-05', 2),
    ('Bachelor of Psychology', '2019-06-06', 2),
    ('Associate Degree in Information Systems', '2019-07-07', 1);

-- get latest books
WITH LatestBooks AS (
  SELECT
    b.ID AS book_id,
    b.Name AS book_name,
    b.Date AS book_date,
    u.ID AS user_id,
    u.Name AS user_name,
    ROW_NUMBER() OVER (PARTITION BY u.ID ORDER BY b.Date DESC) AS row_num
  FROM
    Users u
    JOIN Books b ON u.ID = b.user_id
)

SELECT
  book_id,
  book_name,
  book_date,
  user_id,
  user_name
FROM
  LatestBooks
WHERE
  row_num = 1;
