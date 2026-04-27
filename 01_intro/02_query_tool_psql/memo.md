## 9. 演習記録

### 演習で行ったこと

第2章の演習では、`books` テーブルを作成し、データを追加して、Query Toolで実行結果を確認した。

今回行った流れは次の通りである。

1. `DROP TABLE IF EXISTS` で既存のテーブルを削除する
2. `CREATE TABLE` で新しいテーブルを作成する
3. `INSERT INTO` でデータを追加する
4. `SELECT * FROM` でテーブルの中身を確認する
5. `SELECT 列名, 列名 FROM` で一部の列だけを表示する

---

### 作成したテーブル

```sql
CREATE TABLE books (
    id INTEGER,
    title TEXT,
    price INTEGER
);
