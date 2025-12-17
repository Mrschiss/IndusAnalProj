-- How does demand for each product evolve over time?
-- Due to static price, we can still demand forecast by product, but the price won't have an involving factor
WITH product_daily_sales AS (
    SELECT
        STR_TO_DATE(s.`Date`, '%Y-%m-%d') AS date,
        s.Product_ID,
        SUM(CAST(s.Units AS UNSIGNED)) AS product_units_sold
    FROM mexico_toy_store_wh_db.sales_tbl s
    GROUP BY
        STR_TO_DATE(s.`Date`, '%Y-%m-%d'),
        s.Product_ID
)

SELECT
    pds.date,
    pds.Product_ID,
    pds.product_units_sold,
    CAST(
        REPLACE(REPLACE(p.Product_Price, '$', ''), ',', '')
        AS DECIMAL(10,2)
    ) AS product_price,
    p.Product_Category
FROM product_daily_sales pds
LEFT JOIN mexico_toy_store_wh_db.products_tbl p
    ON pds.Product_ID = p.Product_ID
ORDER BY pds.Product_ID, pds.date;

