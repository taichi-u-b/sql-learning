# practice.sql

```sql
-- 入門編 第2章 Query Tool / psql に慣れる
-- 演習記録：books テーブルを使った基本操作

-- すでに books テーブルがある場合は削除する
DROP TABLE IF EXISTS books;

-- books テーブルを作成する
CREATE TABLE books (
    id INTEGER,
    title TEXT,
    price INTEGER
);

-- books テーブルにデータを追加する
INSERT INTO books VALUES (1, 'SQL入門', 1800);
INSERT INTO books VALUES (2, 'データベース基礎', 2200);
INSERT INTO books VALUES (3, 'PostgreSQL練習帳', 2500);

-- books テーブルのすべてのデータを確認する
SELECT * FROM books;

-- title と price だけを表示する
SELECT title, price
FROM books;
