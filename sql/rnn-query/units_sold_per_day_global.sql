-- Global sales per day, uncomplicated and perfect for first RNN
WITH daily_sales AS (
    SELECT
        STR_TO_DATE(s.Date, '%Y-%m-%d') AS date,
        SUM(CAST(s.Units AS UNSIGNED)) AS total_units_sold
    FROM mexico_toy_store_wh_db.sales_tbl s
    GROUP BY
        STR_TO_DATE(s.Date, '%Y-%m-%d')
)
SELECT
    date,
    total_units_sold
FROM daily_sales
ORDER BY date;
