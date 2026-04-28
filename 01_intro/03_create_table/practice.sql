-- 入門編 第3章：テーブルを作る
-- 学習内容：CREATE TABLE / データ型 / PRIMARY KEY / SERIAL / NOT NULL / DROP TABLE IF EXISTS / ALTER TABLE

-- =====================================================
-- 1. students テーブルの作成
-- =====================================================

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    grade INTEGER
);

-- 作成確認
SELECT *
FROM students;


-- =====================================================
-- 2. books テーブルの作成
-- =====================================================

DROP TABLE IF EXISTS books;

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT,
    price INTEGER
);

-- 作成確認
SELECT *
FROM books;


-- =====================================================
-- 3. events テーブルの作成
-- =====================================================

DROP TABLE IF EXISTS events;

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    event_name TEXT NOT NULL,
    event_date DATE,
    location TEXT
);

-- 作成確認
SELECT *
FROM events;


-- =====================================================
-- 4. products テーブルの作成
-- =====================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    price NUMERIC,
    stock INTEGER
);

-- 作成確認
SELECT *
FROM products;


-- =====================================================
-- 5. members テーブルの作成
-- =====================================================

DROP TABLE IF EXISTS members;

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    age INTEGER
);

-- 作成確認
SELECT *
FROM members;


-- =====================================================
-- 6. study_logs テーブルの作成
-- =====================================================

DROP TABLE IF EXISTS study_logs;

CREATE TABLE study_logs (
    id SERIAL PRIMARY KEY,
    study_date DATE,
    subject TEXT NOT NULL,
    minutes INTEGER,
    memo TEXT
);

-- 作成確認
SELECT *
FROM study_logs;


-- =====================================================
-- 7. 列名を間違えた場合の修正例
-- =====================================================

-- 例：
-- study_date を studey_date と間違えて作った場合は、
-- ALTER TABLE で列名を変更できる。

-- ALTER TABLE study_logs
-- RENAME COLUMN studey_date TO study_date;


-- =====================================================
-- 8. 間違いやすい例：DATA と DATE の違い
-- =====================================================

-- 誤り：
-- PostgreSQLには DATA というデータ型は存在しない。
-- 日付を扱う場合は DATE と書く。

-- CREATE TABLE wrong_study_logs (
--     id SERIAL PRIMARY KEY,
--     study_data DATA,
--     subject TEXT
-- );

-- 正しくは以下のように書く。

-- CREATE TABLE correct_study_logs (
--     id SERIAL PRIMARY KEY,
--     study_date DATE,
--     subject TEXT
-- );


-- =====================================================
-- 9. データ型の確認用メモ
-- =====================================================

-- INTEGER：整数
-- TEXT：文字列
-- NUMERIC：小数を含む数値
-- DATE：日付
-- BOOLEAN：真偽値

-- 例：
-- age INTEGER
-- name TEXT
-- price NUMERIC
-- study_date DATE
-- is_completed BOOLEAN
