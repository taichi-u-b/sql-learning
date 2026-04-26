-- 01_intro / 01_sql_database_overview
-- SQLとデータベースの全体像：実行練習

-- PostgreSQLのバージョン確認
SELECT version();


-- studentsテーブルを作成
-- すでに存在する場合はエラーになる
CREATE TABLE students (
    student_id INTEGER,
    name TEXT,
    grade TEXT,
    age INTEGER
);


-- studentsテーブルの中身を確認
-- テーブル作成直後は、列だけ存在していてデータは入っていない
SELECT *
FROM students;


-- studentsテーブルにデータを追加
-- INSERTは実行するたびにデータが追加されるので、重複実行に注意
INSERT INTO students (student_id, name, grade, age)
VALUES
    (1, '佐藤', '高1', 16),
    (2, '鈴木', '高2', 17),
    (3, '田中', '高1', 16),
    (4, '山田', '高3', 18),
    (5, '伊藤', '高2', 17);


-- studentsテーブルの全データを表示
SELECT *
FROM students;


-- name列だけ表示
SELECT name
FROM students;


-- name列とage列だけ表示
SELECT name, age
FROM students;


-- gradeが高1の生徒だけ表示
SELECT *
FROM students
WHERE grade = '高1';


-- gradeが高1の生徒のnameとageだけ表示
SELECT name, age
FROM students
WHERE grade = '高1';


-- ageが17の生徒だけ表示
SELECT *
FROM students
WHERE age = 17;


-- 重複してデータを入れてしまった場合：
-- studentsテーブル自体は残したまま、中身だけ空にする
TRUNCATE TABLE students;


-- 中身を空にしたあと、再度5人分だけ追加
INSERT INTO students (student_id, name, grade, age)
VALUES
    (1, '佐藤', '高1', 16),
    (2, '鈴木', '高2', 17),
    (3, '田中', '高1', 16),
    (4, '山田', '高3', 18),
    (5, '伊藤', '高2', 17);


-- 最終確認
SELECT *
FROM students;
