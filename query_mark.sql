DROP TABLE IF EXISTS Users;

CREATE TABLE Users (
    ID serial PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Mark VARCHAR(1) NOT NULL
);

INSERT INTO Users (Name, Mark) VALUES
  ('John', 'A'),
  ('Marissa', 'B'),
  ('Bob', 'C'),
  ('Britany', 'C');

WITH MarkCombinations AS (
	SELECT
		Mark,
		count(*) AS total
	FROM
		Users
	GROUP BY
		Mark
)
SELECT
	Mark,
	total
FROM
	MarkCombinations
UNION ALL
SELECT
	CONCAT_WS('+', mc.mark, mc1.mark),
	mc.total + mc1.total AS total
FROM
	MarkCombinations mc
	JOIN MarkCombinations mc1 ON mc.Mark < mc1.Mark
UNION ALL

SELECT
	CONCAT_WS('+', mc.mark, mc1.mark, mc2.mark),
	mc.total + mc1.total + mc2.total AS total
FROM
	MarkCombinations mc
	JOIN MarkCombinations mc1 ON mc.Mark < mc1.Mark
	JOIN MarkCombinations mc2 ON mc1.Mark < mc2.Mark