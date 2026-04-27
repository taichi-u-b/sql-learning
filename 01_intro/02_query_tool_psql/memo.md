# 入門編 第2章 Query Tool / psql に慣れる

## 1. この章の目的

この章の目的は、SQLを書く場所・実行する場所に慣れることである。

SQL学習では、今後たくさんのコードを書くため、

- どこにSQLを書くのか
- どうやって実行するのか
- 実行結果はどこに表示されるのか
- エラーが出たときにどう考えるのか

を理解しておく必要がある。

第2章では、主に pgAdmin の Query Tool を使って、SQLを実行する流れに慣れた。

---

## 2. Query Toolとは

Query Tool は、pgAdmin の中で SQL を書いて実行するための画面である。

Query Tool に SQL を書き、実行ボタンを押すと、PostgreSQL に命令が送られる。

例えば、次のSQLは students テーブルの中身を表示する命令である。

```sql
SELECT * FROM students;
