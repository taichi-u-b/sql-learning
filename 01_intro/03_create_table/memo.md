# 入門編 第3章：テーブルを作る

## この章の目的

この章では、SQLでデータを保存するための「テーブル」を作成する方法を学習した。

テーブルとは、Excelの表のように、行と列でデータを管理する入れ物である。  
SQLでは、データを入れる前に、どのような列を持つテーブルにするかを設計する必要がある。

つまり、第3章は「データを入れる前に、保存先となる箱の設計図を作る章」である。

---

## 学んだこと

### 1. `CREATE TABLE`

新しいテーブルを作成するには、`CREATE TABLE` を使う。

基本形：

```sql
CREATE TABLE テーブル名 (
    列名 データ型,
    列名 データ型
);
```

例：

```sql
CREATE TABLE students (
    id INTEGER,
    name TEXT,
    age INTEGER
);
```

`CREATE TABLE` は、データを入れるための表の設計図を作る命令である。

---

### 2. データ型

SQLでは、列ごとに「どの種類のデータを入れるか」を指定する。  
これをデータ型という。

データ型を決めることで、数値として計算できる列、文字として扱う列、日付として扱う列などを区別できる。

今回学習した主なデータ型：

- `INTEGER`
  - 意味：整数
  - 例：`1`, `100`, `2026`
  - 使う場面：年齢、個数、学習時間、在庫数

- `TEXT`
  - 意味：文字列
  - 例：`'SQL'`, `'Tanaka'`, `'Osaka'`
  - 使う場面：名前、タイトル、メモ、住所

- `NUMERIC`
  - 意味：小数を含む数値
  - 例：`98.5`, `1200.75`
  - 使う場面：価格、割合、点数、金額

- `DATE`
  - 意味：日付
  - 例：`'2026-04-28'`
  - 使う場面：学習日、開催日、登録日

- `BOOLEAN`
  - 意味：真偽値
  - 例：`TRUE`, `FALSE`
  - 使う場面：完了済みか、出席したか、有効か

今回特に使ったデータ型：

```sql
INTEGER
TEXT
NUMERIC
DATE
BOOLEAN
```

データ型を選ぶときの考え方：

- 整数だけを扱う場合
  - `INTEGER`

- 文字を扱う場合
  - `TEXT`

- 小数が入る可能性がある数値を扱う場合
  - `NUMERIC`

- 日付を扱う場合
  - `DATE`

- はい / いいえ、真 / 偽を扱う場合
  - `BOOLEAN`

注意点：

`DATA` というデータ型は存在しない。  
日付を扱いたい場合は、`DATA` ではなく `DATE` と書く。

誤り：

```sql
study_data DATA
```

正しい書き方：

```sql
study_date DATE
```

ここで、`study_date` は列名、`DATE` はデータ型である。

---

### 3. `PRIMARY KEY`

`PRIMARY KEY` は、各行を一意に識別するための列に設定する。

例：

```sql
id SERIAL PRIMARY KEY
```

`id` のような列に設定することで、同じ名前のデータがあっても別の行として区別できる。

イメージ：

- `name` だけだと、同じ名前の人がいたときに区別できない
- `id` があれば、同じ名前でも別の行として区別できる
- その行を一意に識別するための目印が `PRIMARY KEY`

---

### 4. `SERIAL`

`SERIAL` は、PostgreSQLで自動的に連番を振るための書き方である。

例：

```sql
id SERIAL PRIMARY KEY
```

このように書くことで、`id` が `1`, `2`, `3` ... と自動で増えていく。

入門段階では、ID列は次の形で覚える。

```sql
id SERIAL PRIMARY KEY
```

---

### 5. `NOT NULL`

`NOT NULL` は、その列に空欄を許さない制約である。

例：

```sql
name TEXT NOT NULL
```

この場合、`name` には必ず値を入れる必要がある。

使う場面：

- 名前
- タイトル
- 科目名
- 商品名
- 必ず入力してほしい情報

---

### 6. `DROP TABLE IF EXISTS`

練習でテーブルを作り直したい場合は、以下のように書く。

```sql
DROP TABLE IF EXISTS テーブル名;
```

意味：

- そのテーブルが存在していれば削除する
- 存在していなければ何もしない
- その後に `CREATE TABLE` を書けば、テーブルを作り直せる

例：

```sql
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT
);
```

注意点：

`DROP TABLE` はテーブルそのものを削除する。  
中にデータが入っている場合、そのデータも消える。  
練習では便利だが、実務では注意が必要である。

---

### 7. `ALTER TABLE RENAME COLUMN`

列名を間違えて作ってしまった場合は、`ALTER TABLE` を使って列名を修正できる。

基本形：

```sql
ALTER TABLE テーブル名
RENAME COLUMN 古い列名 TO 新しい列名;
```

例：

```sql
ALTER TABLE study_logs
RENAME COLUMN studey_date TO study_date;
```

テーブルを削除せずに列名だけ変更できるため、データが入っている場合はこちらを使う。

---

## 実行したSQLの例

### `students` テーブル

```sql
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    grade INTEGER
);
```

### `books` テーブル

```sql
DROP TABLE IF EXISTS books;

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT,
    price INTEGER
);
```

### `events` テーブル

```sql
DROP TABLE IF EXISTS events;

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    event_name TEXT NOT NULL,
    event_date DATE,
    location TEXT
);
```

### `products` テーブル

```sql
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    price NUMERIC,
    stock INTEGER
);
```

### `members` テーブル

```sql
DROP TABLE IF EXISTS members;

CREATE TABLE members (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    age INTEGER
);
```

### `study_logs` テーブル

```sql
DROP TABLE IF EXISTS study_logs;

CREATE TABLE study_logs (
    id SERIAL PRIMARY KEY,
    study_date DATE,
    subject TEXT NOT NULL,
    minutes INTEGER,
    memo TEXT
);
```

---

## エラーと修正

### 1. 列名を間違えた

`study_date` を `studey_date` と書いてしまった。

この場合、テーブルを作り直さなくても、列名だけ修正できる。

修正SQL：

```sql
ALTER TABLE study_logs
RENAME COLUMN studey_date TO study_date;
```

学んだこと：

- 列名を間違えた場合は、`ALTER TABLE ... RENAME COLUMN ...` で修正できる
- データが入っている場合は、`DROP TABLE` よりも `ALTER TABLE` の方が安全
- 練習中でまだデータがない場合は、`DROP TABLE IF EXISTS` で作り直してもよい

---

### 2. データ型を間違えた

以下のように書いてエラーになった。

```sql
study_data DATA
```

エラー内容：

```text
ERROR: type "data" does not exist
SQL 状態: 42704
```

原因：

PostgreSQLには `DATA` というデータ型が存在しないため。

正しい書き方：

```sql
study_date DATE
```

学んだこと：

- `study_date` は列名
- `DATE` はデータ型
- 日付型は `DATE`
- `DATA` はデータ型ではない
- 英単語としての data と、SQLのデータ型は別物として考える必要がある

---

### 3. 同じテーブル名で再作成しようとするエラー

すでに存在するテーブルを再び `CREATE TABLE` しようとすると、エラーになる。

対処法：

```sql
DROP TABLE IF EXISTS テーブル名;
```

を先に書いてから、`CREATE TABLE` を実行する。

例：

```sql
DROP TABLE IF EXISTS study_logs;

CREATE TABLE study_logs (
    id SERIAL PRIMARY KEY,
    study_date DATE,
    subject TEXT NOT NULL,
    minutes INTEGER,
    memo TEXT
);
```

---

## pgAdminで学んだ操作

### スクリプト実行

Query Tool では、`F5` でSQLを実行できる。

```text
F5
```

一部だけ選択して `F5` を押すと、選択した部分だけ実行できる。  
何も選択していない場合は、基本的にスクリプト全体が実行される。

---

### クエリ欄を全消しする方法

クエリ欄のSQL文をすべて消すには、以下を使う。

```text
Ctrl + A → Backspace
```

または

```text
Ctrl + A → Delete
```

注意点：

Query Tool 上の文字を消しても、すでに作成したテーブルやデータは消えない。  
消えるのは、画面に書いてあるSQL文だけである。

---

## よくあるミス

### 1. 最後のカンマをつけてしまう

誤り：

```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER,
);
```

最後の `age INTEGER,` のカンマが余計である。

正しくは以下の通り。

```sql
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name TEXT,
    age INTEGER
);
```

---

### 2. `DATE` と `DATA` を間違える

誤り：

```sql
study_data DATA
```

正しくは以下の通り。

```sql
study_date DATE
```

ポイント：

- `study_date` は列名
- `DATE` は日付型
- `DATA` はデータ型ではない

---

### 3. 列名とデータ型を混同する

誤りの例：

```sql
study_data DATA
```

この場合、`study_data` は列名としては使えるが、`DATA` がデータ型として存在しないためエラーになる。

正しい考え方：

```sql
列名 データ型
```

例：

```sql
study_date DATE
subject TEXT
minutes INTEGER
```

---

### 4. すでにあるテーブルをまた作ろうとする

誤り：

```sql
CREATE TABLE study_logs (
    id SERIAL PRIMARY KEY,
    study_date DATE
);
```

すでに `study_logs` が存在している場合、エラーになる。

練習では以下のように書くとよい。

```sql
DROP TABLE IF EXISTS study_logs;

CREATE TABLE study_logs (
    id SERIAL PRIMARY KEY,
    study_date DATE
);
```

---

## この章で最低限覚えること

- テーブルはデータを保存するための入れ物である
- テーブル作成には `CREATE TABLE` を使う
- テーブル作成では、列名とデータ型を指定する
- 整数は `INTEGER`
- 文字列は `TEXT`
- 日付は `DATE`
- 小数を含む数値は `NUMERIC`
- 真偽値は `BOOLEAN`
- ID列には `SERIAL PRIMARY KEY` を使う
- `PRIMARY KEY` は各行を一意に識別するための制約である
- `NOT NULL` は空欄禁止の制約である
- 練習でテーブルを作り直すときは `DROP TABLE IF EXISTS` を使う
- 列名を修正するときは `ALTER TABLE ... RENAME COLUMN ...` を使う
- `DATA` というデータ型は存在しない
- 日付型は `DATE` と書く

---

## 感想・理解したこと

テーブル作成は、単に表を作るだけではなく、どの列にどのようなデータを入れるかを事前に決める作業だと理解した。

特に、`study_date DATE` のように、列名とデータ型を分けて考える必要がある。  
列名は自分で決める名前であり、データ型はPostgreSQLで決められた型を使う。

また、`DATA` と `DATE` の違いから、SQLでは英単語として自然に見える言葉でも、データ型として存在しなければ使えないことを学んだ。

今回の学習で、SQLではデータを入れる前に「入れ物の設計」をすることが重要だとわかった。
