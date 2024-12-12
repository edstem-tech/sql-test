CREATE TABLE bookmark (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  url VARCHAR(255),
  tag VARCHAR(255)
);

INSERT INTO bookmark (id, title, url, tag)
VALUES
  (1, 'Google', 'https://www.google.com', 'Search'),
  (2, 'Stack Overflow', 'https://www.stackoverflow.com', 'Development'),
  (3, 'GitHub', 'https://www.github.com', 'Development'),
  (4, 'Amazon', 'https://www.amazon.com', 'Shopping'),
  (5, 'Wikipedia', 'https://www.wikipedia.org', 'Reference'),
  (6, 'Flipkart', 'https://www.flipkart.com', 'Shopping'),
  (7, 'Ajio', 'https://www.ajio.in', 'Shopping');

CREATE TABLE collection (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  tag VARCHAR(255)
);

INSERT INTO collection (id, name, tag)
VALUES
  (1, 'Development Resources', 'Development'),
  (2, 'Shopping', 'Shopping'),
  (3, 'News', 'News'),
  (4, 'Development Resources', 'Development'),
  (5, 'News', 'News'),
  (6, 'Shopping', 'Shopping'),
  (7, 'Development Resources', 'Development');

SELECT b.title, b.url, b.tag FROM Bookmark b
JOIN collection c ON b.id = c.id
WHERE c.name = 'Development Resources';