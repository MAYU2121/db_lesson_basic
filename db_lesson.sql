
-- Q1
USE db_lesson

 CREATE TABLE departments(
 department_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 );

 ALTER TABLE departments
 MODIFY created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
 MODIFY updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_
TIMESTAMP;
-- Q2
ALTER TABLE people
ADD department_id INT UNSIGNED NULL;

ALTER TABLE departments
MODIFY department_id INT UNSIGNED NULL AFTER email;

-- Q3
INSERT INTO department (name)
VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

 INSERT INTO people (name, email, department_id, age, gender)
 ('相内すみ', 'AA@gmail.com', 1, 30, 1),
 ('小野寺きょうへい', 'BB@gmail.com', 1, 31, 2),
 ('山口とおる', 'CC@gmail.com', 1, 32, 1),
 ('角田まみ', 'DD@gmail.com', 2, 34, 1),
('門脇きょうこ', 'EE@gail.com', 2, 40, 1),
 ('酒向みさ', 'FF@gamail.com', 2, 29, 1),
('小林ゆみか', 'GG@gamail.com', 2, 43, 1),
('田中ゆうき', 'HH@gmail.com', 3, 40, 2),
('佐藤たけし', 'II@gmail.com', 4, 33, 2),
('竹内しゅうと', 'JJ@gmail.com', 5, 29, 2);

INSERT INTO reports (person_id, content)
VALUES
(16,'日報を提出します。今日は9月1日です。'),
(17,'日報を提出します。今日は9月2日です。'),
(18,'日報を提出します。今日は9月3日です。'),
(19,'日報を提出します。今日は9月4日です。'),
(20,'日報を提出します。今日は9月5日です。'),
(21,'日報を提出します。今日は9月6日です。'),
(22,'日報を提出します。今日は9月7日です。'),
(23,'日報を提出します。今日は9月8日です。'),
(24,'日報を提出します。今日は9月9日です。'),
(25,'日報を提出します。今日は9月10日です。');

-- Q4
UPDATE people SET department_id = 1 WHERE person_id = 1;
UPDATE people SET department_id = 1 WHERE person_id = 3;
UPDATE people SET department_id = 1 WHERE person_id = 4;
UPDATE people SET department_id = 1 WHERE person_id = 5;

-- Q5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6
peopleテーブルから、nameとemailとageのカラム（列）を取得します。
ただし、department_idが１のカラムに限り表示ます。
作成日が古いものが一番上にくるように並べる（昇順）ため、ORDER BYを用いて並べ替えます。
デフォルトはASC（昇順）なので省略可能です。
-- Q7
SELECT name
FROM people
WHERE
  (gender = 1 AND age BETWEEN 20 AND 29)
  OR
  (gender = 2 AND age BETWEEN 40 AND 49);

-- Q8
SELECT name FROM people WHERE department_id = 1;


-- Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 GROUP BY gender = 2;

SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

-- Q10
SELECT p.name, d.name, r.content 
FROM people AS p 
INNER JOIN departments AS d ON p.department_id = d.department_id
INNER JOIN reports AS r ON p.person_id = r.person_id;

-- Q11
SELECT p.name 
FROM people AS p
LEFT JOIN reports AS r USING (person_id)
WHERE r.person_id IS NULL;


