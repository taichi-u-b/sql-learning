
必要なら、`practice.sql` はこれでよいです。

```sql
-- 入門編 第4章 データを入れる

-- 1行だけデータを追加する
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES ('2026-04-30', 'SQL', 60, 'INSERT文の練習');

-- データを確認する
SELECT *
FROM study_logs;

-- 複数行をまとめて追加する
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES
    ('2026-05-01', '統計', 90, '区間推定を復習'),
    ('2026-05-02', 'Python', 75, 'pandasの練習'),
    ('2026-05-03', 'SQL', 45, 'VARCHARとTEXTを復習');

-- データを確認する
SELECT *
FROM study_logs;

-- エラー修正後のSQL
INSERT INTO study_logs (study_date, subject, study_time, memo)
VALUES ('2026-05-04', 'SQL', 60, 'INSERT文の復習');

-- データを確認する
SELECT *
FROM study_logs;
