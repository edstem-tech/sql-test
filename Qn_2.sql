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


SELECT tag, COUNT(*) AS usage_count
FROM bookmark
GROUP BY tag
ORDER BY usage_count DESC
LIMIT 10;