# sql-learning
Learning records for SQL and PostgreSQL.
# SQL Learning

## 目的
データ基盤SEとして必要なSQLとPostgreSQLの基礎を学習し、学習内容を記録する。

## 学習内容
- SQLの基本構文
- PostgreSQLの基本操作
- SELECT / WHERE / ORDER BY
- GROUP BY / HAVING
- JOIN
- サブクエリ
- データベース設計の基礎

## 学習ルール
- 各単元ごとに `memo.md` と `practice.sql` を作成する
- `memo.md` には概念・構文・注意点をまとめる
- `practice.sql` には実際に書いたSQLを残す
- 間違えた内容は `mistakes.md` に記録する

## 使用環境
- PostgreSQL
- pgAdmin
- psql

# SQL学習記録

PostgreSQLを使ってSQLを学ぶための学習記録です。  
このリポジトリでは、**入門編**と**基礎編**に分けて、SQLの理解と実践を段階的に積み上げていきます。

---

## 学習方針
- PostgreSQLを使って手を動かしながら学ぶ
- 各章ごとに `memo.md` と `practice.sql` を残す
- `memo.md` では章の要点や学びを整理する
- `practice.sql` では実際に入力したSQLを記録する

---

# 入門編
入門編では、**1テーブルを使ったSQLの基本操作**を学びます。  
まずは「テーブルからデータを取り出す」「追加する」「更新する」「削除する」といった、SQLの土台を固めます。

## 章立て
1. SQLとデータベースの全体像  
2. Query Tool / psql に慣れる  
3. テーブルを作る  
4. データを入れる  
5. データを取り出す  
6. 条件で絞る  
7. 並べ替えと件数制限  
8. データを更新・削除する  
9. 入門編の総合演習  

---

# 基礎編
基礎編では、**複数テーブルの扱い・集計・設計の初歩**を学びます。  
SQLの中心となる `JOIN` や `GROUP BY` を軸に、より実践的な書き方へ進みます。

## 章立て
1. 複数テーブルの考え方  
2. JOINの基礎  
3. JOINの発展  
4. 集計関数  
5. GROUP BY  
6. HAVING  
7. NULLの理解  
8. 条件分岐と値の補完  
9. サブクエリ  
10. 設計の初歩  
11. CTEの入り口  
12. 基礎編の総合演習  

---

# ディレクトリ構成
```text
sql-study/
  README.md
  intro/
    chapter01/
      memo.md
      practice.sql
    chapter02/
      memo.md
      practice.sql
    ...
  basic/
    chapter01/
      memo.md
      practice.sql
    chapter02/
      memo.md
      practice.sql
    ...
