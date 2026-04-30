# 入門5章：データを取り出す

## 学習日

2026-04-30

## この章の目的

この章では、SQLの基本である `SELECT` 文を学習した。

これまでに学んだ内容は、以下の流れである。

- テーブルを作成する
- データを挿入する
- データを取り出す

入門5章では、単にテーブルの中身を見るだけでなく、必要な列を選び、計算や文字列加工を行い、目的に応じた結果表を作る練習を行った。

## 学習したこと

### SELECT文の基本

`SELECT` 文は、テーブルからデータを取り出すための命令である。

基本構文は以下の通り。

SELECT 列名
FROM テーブル名;

すべての列を表示したい場合は、`*` を使う。

SELECT *
FROM books;

特定の列だけを表示したい場合は、列名を指定する。

SELECT title, author, price
FROM books;

## SELECT文の考え方

`SELECT` は、元のテーブルをそのまま表示するだけの命令ではない。

重要なのは、`SELECT` は元テーブルから一時的な結果表を作る操作だという点である。

たとえば、次のSQLを実行しても、元の `books` テーブルの構造やデータは変更されない。

SELECT title, price
FROM books;

これは、`books` テーブルから `title` と `price` だけを取り出した結果表を表示しているだけである。

## 元テーブルと結果表の違い

元テーブルは、データベースに保存されている実際の表である。

一方、`SELECT` の結果として表示される表は、一時的な結果表である。

そのため、以下のような操作をしても元のデータは変わらない。

SELECT title, price + 100 AS new_price
FROM books;

これは価格を100円上げた結果を表示しているだけであり、元の `price` は更新されない。

実際にデータを変更するには、`UPDATE` を使う必要がある。

## SELECTでできること

今回の章では、以下の内容を学習した。

- 全列を表示する
- 必要な列だけを表示する
- 列の表示順を変える
- 計算結果を表示する
- `AS` で列に別名をつける
- 文字列を結合する
- `DISTINCT` で重複を取り除く
- `SELECT` と `UPDATE` の違いを理解する

## 作成したテーブル

今回の演習では、`books` テーブルを作成した。

テーブルの列は以下の通り。

- `book_id`
  - 本を識別するID
  - 整数型
- `title`
  - 本のタイトル
  - 文字列型
- `author`
  - 著者名
  - 文字列型
- `price`
  - 価格
  - 整数型
- `genre`
  - ジャンル
  - 文字列型
- `stock`
  - 在庫数
  - 整数型

## 実行したSQLの内容

### テーブル作成

`CREATE TABLE` を使って、`books` テーブルを作成した。

CREATE TABLE books (
    book_id INTEGER,
    title VARCHAR(100),
    author VARCHAR(50),
    price INTEGER,
    genre VARCHAR(30),
    stock INTEGER
);

### データ挿入

`INSERT INTO` を使って、複数行のデータをまとめて挿入した。

INSERT INTO books (book_id, title, author, price, genre, stock)
VALUES
    (1, 'こころ', '夏目漱石', 500, '小説', 12),
    (2, '吾輩は猫である', '夏目漱石', 600, '小説', 8),
    (3, '人間失格', '太宰治', 550, '小説', 10),
    (4, 'SQL入門', '田中一郎', 2200, 'IT', 5),
    (5, 'Python基礎', '佐藤花子', 2500, 'IT', 7),
    (6, '統計学入門', '鈴木次郎', 2800, '統計', 4),
    (7, 'データ分析実践', '佐藤花子', 3200, '統計', 3);

### 全データの確認

SELECT *
FROM books;

このSQLで、`books` テーブルにデータが正しく入っているか確認した。

### 必要な列だけ表示

SELECT title, author, price
FROM books;

`SELECT *` ではなく、必要な列だけを指定して表示した。

### 列の順番を変えて表示

SELECT author, title, genre
FROM books;

元テーブルの列順とは関係なく、`SELECT` で指定した順番で結果表が表示されることを確認した。

### 税込価格の表示

SELECT
    title,
    price,
    price * 1.10 AS tax_included_price
FROM books;

`price * 1.10` によって、税込価格を計算して表示した。

`AS tax_included_price` によって、計算結果の列名を分かりやすくした。

### 在庫金額の表示

SELECT
    title,
    price,
    stock,
    price * stock AS stock_value
FROM books;

価格と在庫数を掛け合わせて、在庫金額を計算した。

これは、SQLで既存の列を使って新しい意味のある列を作る例である。

### 表示用の本名を作成

SELECT
    title || '（' || author || '）' AS book_label
FROM books;

PostgreSQLでは、文字列の結合に `||` を使う。

このSQLでは、タイトルと著者名を結合し、表示用のラベルを作成した。

### ジャンルの種類を確認

SELECT DISTINCT genre
FROM books;

`DISTINCT` を使うことで、重複を取り除き、登録されているジャンルの種類だけを確認した。

### 著者の一覧を確認

SELECT DISTINCT author
FROM books;

登録されている著者を重複なしで表示した。

### 著者とジャンルの組み合わせを確認

SELECT DISTINCT author, genre
FROM books;

このSQLでは、`author` だけで重複を消しているのではなく、`author` と `genre` の組み合わせで重複を判定している。

## 重要な考え方

### SELECTは元データを変更しない

`SELECT` は、データを表示するための命令であり、元のテーブルを変更しない。

たとえば、以下のSQLを実行しても、元の価格は変わらない。

SELECT
    title,
    price,
    price + 100 AS new_price
FROM books;

これは、価格を100円上げた結果を表示しているだけである。

一方で、実際にデータを変更するには以下のように `UPDATE` を使う。

UPDATE books
SET price = price + 100;

今回の章では、`SELECT` と `UPDATE` の違いを意識した。

## よくあるミス

### カンマの書き忘れ

複数の列を指定するときは、列名の間にカンマが必要である。

誤りの例。

SELECT title price
FROM books;

正しい例。

SELECT title, price
FROM books;

### テーブル名の間違い

テーブル名を間違えると、存在しないテーブルとしてエラーになる。

例。

SELECT *
FROM book;

実際のテーブル名が `books` であれば、正しくは以下のように書く。

SELECT *
FROM books;

### 列名の間違い

存在しない列名を指定するとエラーになる。

例。

SELECT titles
FROM books;

実際の列名が `title` であれば、正しくは以下のように書く。

SELECT title
FROM books;

### SELECTとUPDATEの混同

`SELECT price + 100` は、表示上の計算である。

`UPDATE books SET price = price + 100` は、実際にデータを書き換える操作である。

この違いを混同しないようにする。

## 実務での注意点

### SELECT * は便利だが多用しない

学習中は、テーブル全体を確認するために `SELECT *` を使ってよい。

ただし、実務では必要な列だけを指定する方がよい。

理由は以下の通り。

- 不要な列まで取得してしまう
- データ量が多いと処理が重くなる
- どの列を使っているSQLなのか分かりにくくなる
- テーブル構造が変わったときに影響を受けやすい

そのため、確認用には `SELECT *` を使い、実際の処理では必要な列を指定する意識を持つ。

## 今後の章とのつながり

入門5章では、主に「どの列を表示するか」を学習した。

今後の章では、以下の内容につながっていく。

- 入門6章：条件で絞る
  - `WHERE` を使って、どの行を表示するかを指定する
- 入門7章：並べ替えと件数制限
  - `ORDER BY` や `LIMIT` を使って、結果表の並び順や件数を調整する
- 基礎編：集計やJOIN
  - `GROUP BY` や `JOIN` と組み合わせて、より実務的なデータ取得を行う

今回の `SELECT` は、今後のSQL学習の土台になる。

## 最低限覚えること

この章で最低限覚えるべきことは以下である。

- `SELECT * FROM テーブル名;` で全列を表示できる
- `SELECT 列名 FROM テーブル名;` で特定の列だけ表示できる
- `SELECT 列名1, 列名2 FROM テーブル名;` で複数列を表示できる
- `AS` を使うと、列に別名をつけられる
- `price * stock` のように、列同士で計算できる
- PostgreSQLでは `||` で文字列を結合できる
- `DISTINCT` で重複を取り除ける
- `SELECT` は元テーブルを変更せず、結果表を作る操作である

## 感想

入門5章では、SQLの中心である `SELECT` 文を学習した。

最初は単にデータを表示するだけの命令に見えるが、実際には必要な列を選び、計算や文字列加工を行い、目的に合った結果表を作る操作であると理解した。

特に、元テーブルと結果表は別物であり、`SELECT` では元データが変更されないという点が重要だと感じた。

今後は `WHERE` や `ORDER BY` と組み合わせて、より実務的に必要なデータを取り出せるようにしたい。
