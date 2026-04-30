-- 入門5章：データを取り出す
-- テーブル作成からSELECTまでの横断演習

-- booksテーブルを作成
CREATE TABLE books (
    book_id INTEGER,
    title VARCHAR(100),
    author VARCHAR(50),
    price INTEGER,
    genre VARCHAR(30),
    stock INTEGER
);

-- booksテーブルにデータを挿入
INSERT INTO books (book_id, title, author, price, genre, stock)
VALUES
    (1, 'こころ', '夏目漱石', 500, '小説', 12),
    (2, '吾輩は猫である', '夏目漱石', 600, '小説', 8),
    (3, '人間失格', '太宰治', 550, '小説', 10),
    (4, 'SQL入門', '田中一郎', 2200, 'IT', 5),
    (5, 'Python基礎', '佐藤花子', 2500, 'IT', 7),
    (6, '統計学入門', '鈴木次郎', 2800, '統計', 4),
    (7, 'データ分析実践', '佐藤花子', 3200, '統計', 3);

-- 全データを確認
SELECT *
FROM books;

-- 必要な列だけを表示
SELECT title, author, price
FROM books;

-- 列の順番を変えて表示
SELECT author, title, genre
FROM books;

-- 税込価格を計算して表示
SELECT
    title,
    price,
    price * 1.10 AS tax_included_price
FROM books;

-- 在庫金額を計算して表示
SELECT
    title,
    price,
    stock,
    price * stock AS stock_value
FROM books;

-- タイトルと著者名を結合して表示
SELECT
    title || '（' || author || '）' AS book_label
FROM books;

-- ジャンルの種類を重複なしで表示
SELECT DISTINCT genre
FROM books;

-- 著者の一覧を重複なしで表示
SELECT DISTINCT author
FROM books;

-- 著者とジャンルの組み合わせを重複なしで表示
SELECT DISTINCT author, genre
FROM books;

-- SELECTは元データを変更しないことを確認する
SELECT
    title,
    price,
    price + 100 AS new_price
FROM books;

-- 元のpriceが変わっていないことを確認
SELECT *
FROM books;
