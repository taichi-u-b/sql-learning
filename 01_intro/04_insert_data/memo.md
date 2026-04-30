# 入門編 第4章 データを入れる

## 学習日

2026-04-30

## この章のテーマ

この章では、作成したテーブルに実際のデータを追加する方法を学習した。

前章までで、データベースの基本操作、Query Tool の使い方、テーブル作成を学んだ。第4章では、空のテーブルに対して `INSERT INTO` を使い、1行または複数行のデータを登録する方法を練習した。

## 学習した内容

- `INSERT INTO` を使ってテーブルにデータを追加する方法
- 列名と値の対応関係
- 文字列・日付・数値の書き方
- `SERIAL` 型の `id` は基本的に自動採番されること
- 複数行をまとめて追加する方法
- データを追加した後に `SELECT` で確認する流れ
- `VARCHAR` と `TEXT` の違い

## 基本構文

```sql
INSERT INTO テーブル名 (列名1, 列名2, 列名3)
VALUES (値1, 値2, 値3);
```

例：

```sql
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES ('2026-04-30', 'SQL', 60, 'INSERT文の練習');
```

## 今回使ったテーブル

```sql
CREATE TABLE study_logs (
    id SERIAL PRIMARY KEY,
    study_date DATE,
    subject VARCHAR(50),
    study_time INTEGER,
    memo TEXT
);
```

## 各列の意味

- `id`
  - 各データを識別するための番号
  - `SERIAL` を使っているため、自動で番号が増える

- `study_date`
  - 学習日
  - `DATE` 型

- `subject`
  - 学習した科目・分野
  - `VARCHAR(50)` 型
  - 最大50文字までの文字列を入れられる

- `study_time`
  - 学習時間
  - `INTEGER` 型
  - 分単位などの整数を入れる

- `memo`
  - 学習内容のメモ
  - `TEXT` 型
  - 長めの文章を入れられる

## データ型の整理

- `SERIAL`
  - 自動で連番を付ける型
  - 主キーの `id` などで使う

- `DATE`
  - 日付を入れる型
  - 例：`'2026-04-30'`

- `VARCHAR(50)`
  - 最大50文字までの文字列を入れる型
  - 科目名や名前など、長さの上限を決めたい文字列に使う

- `INTEGER`
  - 整数を入れる型
  - 学習時間、点数、個数などに使う

- `TEXT`
  - 長い文字列を入れる型
  - メモや説明文などに使う

## 文字列・日付・数値の書き方

- 文字列はシングルクォートで囲む
  - 例：`'SQL'`
  - 例：`'統計'`
  - 例：`'Python'`

- 日付もシングルクォートで囲む
  - 例：`'2026-04-30'`

- 数値はシングルクォートで囲まない
  - 例：`60`
  - 例：`90`
  - 例：`120`

## 1行のデータを入れるSQL

```sql
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES ('2026-04-30', 'SQL', 60, 'INSERT文の練習');
```

## 複数行をまとめて入れるSQL

```sql
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES
    ('2026-05-01', '統計', 90, '区間推定を復習'),
    ('2026-05-02', 'Python', 75, 'pandasの練習'),
    ('2026-05-03', 'SQL', 45, 'VARCHARとTEXTを復習');
```

## データを確認するSQL

```sql
SELECT *
FROM study_logs;
```

## 学習中に理解したこと

`INSERT INTO` は、テーブルに新しい行を追加するための命令である。

重要なのは、列名と値の順番を正しく対応させること。

例えば、次のSQLでは、

```sql
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES ('2026-04-30', 'SQL', 60, 'INSERT文の練習');
```

それぞれ次のように対応している。

- `study_date` に `'2026-04-30'`
- `subject` に `'SQL'`
- `study_time` に `60`
- `memo` に `'INSERT文の練習'`

また、`id` は `SERIAL PRIMARY KEY` にしているため、自分で値を書かなくても自動で番号が入る。

## よくあるミス

### 文字列をシングルクォートで囲み忘れる

間違い：

```sql
VALUES ('2026-04-30', SQL, 60, 'INSERT文の練習');
```

正しい書き方：

```sql
VALUES ('2026-04-30', 'SQL', 60, 'INSERT文の練習');
```

### 日付をシングルクォートで囲み忘れる

間違い：

```sql
VALUES (2026-04-30, 'SQL', 60, 'INSERT文の練習');
```

正しい書き方：

```sql
VALUES ('2026-04-30', 'SQL', 60, 'INSERT文の練習');
```

### 列の数と値の数が合っていない

間違い：

```sql
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES ('2026-04-30', 'SQL', 60);
```

正しい書き方：

```sql
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES ('2026-04-30', 'SQL', 60, 'INSERT文の練習');
```

### カンマを忘れる

間違い：

```sql
VALUES ('2026-04-30' 'SQL', 60, 'INSERT文の練習');
```

正しい書き方：

```sql
VALUES ('2026-04-30', 'SQL', 60, 'INSERT文の練習');
```

## VARCHARについて

`VARCHAR` は文字列を入れるためのデータ型である。

```sql
subject VARCHAR(50)
```

は、`subject` 列に最大50文字までの文字列を入れられるという意味。

科目名や名前のように、比較的短い文字列を入れるときに使う。

## VARCHARとTEXTの違い

- `VARCHAR(50)`
  - 最大文字数を決める文字列型
  - 例：科目名、名前、カテゴリ名

- `TEXT`
  - 長い文章を入れる文字列型
  - 例：メモ、説明文、感想

今回のテーブルでは、次のように使い分けている。

```sql
subject VARCHAR(50),
memo TEXT
```

これは、`subject` は短い科目名、`memo` は長めのメモになる可能性があるためである。

## エラー修正の考え方

次のSQLは間違っている。

```sql
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES (2026-05-04, SQL, 60, INSERT文の復習);
```

間違いの理由：

- 日付 `2026-05-04` がシングルクォートで囲まれていない
- 文字列 `SQL` がシングルクォートで囲まれていない
- 文字列 `INSERT文の復習` がシングルクォートで囲まれていない

正しいSQL：

```sql
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES ('2026-05-04', 'SQL', 60, 'INSERT文の復習');
```

## 操作メモ

- データを入れるときは `INSERT INTO`
- データを確認するときは `SELECT`
- `INSERT` した後は、必ず `SELECT * FROM テーブル名;` で確認する
- Query Tool にコードを書いて実行しても、コードを消しただけではテーブルやデータは消えない
- データを消すには、別途 `DELETE` や `DROP TABLE` などの命令が必要

## 最低限覚えること

- データを追加する命令は `INSERT INTO`
- 基本形は `INSERT INTO テーブル名 (列名) VALUES (値);`
- 文字列と日付は `' '` で囲む
- 数値はそのまま書く
- `SERIAL` の `id` は基本的に自動で入る
- 複数行をまとめて入れる場合は、`VALUES` の後にカンマ区切りで複数行を書く
- 追加後は `SELECT * FROM テーブル名;` で確認する

## 感想

第4章では、テーブルにデータを入れる基本操作を学んだ。

前章まではテーブルという「箱」を作る操作だったが、今回はその箱に実際のデータを追加したため、データベースを操作している感覚が強くなった。

特に、文字列や日付をシングルクォートで囲むこと、列名と値の順番を対応させることが重要だと分かった。

今後は、データを入れた後に条件を指定して取り出す操作へ進むことで、より実務的なSQLの使い方につながると感じた。
