CREATE TABLE bookmark (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  url VARCHAR(255),
  tag VARCHAR(255),
  collection_id INT,
  creator_id INT,
  created_at TIMESTAMP,
  FOREIGN KEY (collection_id) REFERENCES collection(id),
  FOREIGN KEY (creator_id) REFERENCES users(id)
);

INSERT INTO bookmark (id, title, url, tag, collection_id, creator_id, created_at)
VALUES
  (1, 'Google', 'https://www.google.com', 'Search', 1, 1, NOW() - INTERVAL '20 days'),
  (2, 'Stack Overflow', 'https://www.stackoverflow.com', 'Development', 1, 1, NOW() - INTERVAL '25 days'),
  (3, 'GitHub', 'https://www.github.com', 'Development', 1, 1, NOW() - INTERVAL '15 days'),
  (4, 'Amazon', 'https://www.amazon.com', 'Shopping', 2, 2, NOW() - INTERVAL '25 days'),
  (5, 'Wikipedia', 'https://www.wikipedia.org', 'Reference', 3, 3, NOW() - INTERVAL '10 days'),
  (6, 'Flipkart', 'https://www.flipkart.com', 'Shopping', 2, 2, NOW() - INTERVAL '20 days'),
  (7, 'Ajio', 'https://www.ajio.in', 'Shopping', 2, 2, NOW() - INTERVAL '5 days');


CREATE TABLE collectionShare (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  tag VARCHAR(255),
  collection_id INT,
  receiver_id INT,
  shared_at TIMESTAMP,
  FOREIGN KEY (collection_id) REFERENCES collection(id),
  FOREIGN KEY (receiver_id) REFERENCES users(id)
);


INSERT INTO collectionShare (id, name, tag, collection_id, receiver_id, shared_at)
VALUES
  (1, 'Development Resources', 'Development', 1, 2, NOW() - INTERVAL '20 days'),
  (2, 'Shopping', 'Shopping', 2, 1, NOW() - INTERVAL '25 days'),
  (3, 'News', 'News', 3, 3, NOW() - INTERVAL '10 days'),
  (4, 'Development Resources', 'Development', 1, 1, NOW() - INTERVAL '15 days'),
  (5, 'News', 'News', 3, 2, NOW() - INTERVAL '5 days'),
  (6, 'Shopping', 'Shopping', 2, 3, NOW() - INTERVAL '20 days'),
  (7, 'Development Resources', 'Development', 1, 2, NOW() - INTERVAL '5 days');

SELECT u.id, u.email, 
       COUNT(DISTINCT b.id) AS bookmarks_created,
       COUNT(DISTINCT cs.id) AS collections_shared
FROM users u
JOIN bookmark b ON u.id = b.creator_id
JOIN collectionShare cs ON u.id = cs.receiver_id
WHERE b.created_at > NOW() - INTERVAL '30 days'
AND cs.shared_at > NOW() - INTERVAL '30 days'
GROUP BY u.id, u.email
HAVING COUNT(DISTINCT b.id) > 0 AND COUNT(DISTINCT cs.id) > 0;