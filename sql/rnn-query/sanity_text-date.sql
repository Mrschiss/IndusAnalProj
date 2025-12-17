SELECT
    COUNT(*) AS n_rows,
    COUNT(DISTINCT date) AS unique_dates
FROM (
    SELECT
        STR_TO_DATE(Date, '%Y-%m-%d') AS date
    FROM mexico_toy_store_wh_db.sales_tbl
) t;

SELECT
    COUNT(*) AS total_rows,
    SUM(STR_TO_DATE(`Date`, '%Y-%m-%d') IS NULL) AS null_parsed_dates
FROM mexico_toy_store_wh_db.sales_tbl;