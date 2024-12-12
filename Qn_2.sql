CREATE TABLE users (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);

INSERT INTO users (id, name, email)
VALUES
  (1, 'John Doe', 'john.doe@example.com'),
  (2, 'Jane Smith', 'jane.smith@example.com'),
  (3, 'Alice Johnson', 'alice.johnson@example.com');



CREATE TABLE collection (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  tag VARCHAR(255),
  ispublic BOOLEAN,
  owner_id INT,
  FOREIGN KEY (owner_id) REFERENCES users(id)
);

INSERT INTO collection (id, name, tag, ispublic, owner_id)
VALUES
  (1, 'Development Resources', 'Development', true, 1),
  (2, 'Shopping', 'Shopping', true, 2),
  (3, 'News', 'News', true, 3),
  (4, 'Development Resources', 'Development', true, 1),
  (5, 'News', 'News', false, 2),
  (6, 'Shopping', 'Shopping', false, 3),
  (7, 'Development Resources', 'Development', true, 1);
  
 CREATE TABLE collectionShare (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  tag VARCHAR(255),
  collection_id INT,
  FOREIGN KEY (collection_id) REFERENCES collection(id)
);

INSERT INTO collectionShare (id, name, tag, collection_id)
VALUES
  (1, 'Development Resources', 'Development', 1),
  (2, 'Shopping', 'Shopping', 2),
  (3, 'News', 'News', 3),
  (4, 'Development Resources', 'Development', 1),
  (5, 'News', 'News', 3),
  (6, 'Shopping', 'Shopping', 2),
  (7, 'Development Resources', 'Development', 1);
  
CREATE TABLE bookmark (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  url VARCHAR(255),
  tag VARCHAR(255),
  collection_id INT,
  FOREIGN KEY (collection_id) REFERENCES collection(id)
);

INSERT INTO bookmark (id, title, url, tag, collection_id)
VALUES
  (1, 'Google', 'https://www.google.com', 'Search', 2),
  (2, 'Stack Overflow', 'https://www.stackoverflow.com', 'Development', 1),
  (3, 'GitHub', 'https://www.github.com', 'Development', 1),
  (4, 'Amazon', 'https://www.amazon.com', 'Shopping', 2),
  (5, 'Wikipedia', 'https://www.wikipedia.org', 'Reference', 3),
  (6, 'Flipkart', 'https://www.flipkart.com', 'Shopping', 2),
  (7, 'Ajio', 'https://www.ajio.in', 'Shopping', 2);

SELECT c.name AS collection_name,
u.email AS owner_email, COUNT(b.id) AS number_of_bookmarks,
COUNT(cs.id) AS users_shared
FROM collection c
JOIN users u ON c.owner_id = u.id
LEFT JOIN bookmark b ON c.id = b.collection_id
LEFT JOIN collectionShare cs ON c.id = cs.collection_id
WHERE c.isPublic = true
GROUP BY c.name, u.email
HAVING COUNT(cs.id) > 0;
