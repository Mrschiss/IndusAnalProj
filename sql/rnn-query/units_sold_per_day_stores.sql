-- How does each stores total daily demand evolve over time?
WITH store_daily_sales AS (
    SELECT
        STR_TO_DATE(s.`Date`, '%Y-%m-%d') AS date,
        s.Store_ID,
        SUM(CAST(s.Units AS UNSIGNED)) AS store_units_sold
    FROM mexico_toy_store_wh_db.sales_tbl s
    GROUP BY
        STR_TO_DATE(s.`Date`, '%Y-%m-%d'),
        s.Store_ID
),

store_daily_price AS (
    SELECT
        STR_TO_DATE(s.`Date`, '%Y-%m-%d') AS date,
        s.Store_ID,
        AVG(
            CAST(
                REPLACE(REPLACE(p.Product_Price, '$', ''), ',', '')
                AS DECIMAL(10,2)
            )
        ) AS avg_product_price
    FROM mexico_toy_store_wh_db.sales_tbl s
    LEFT JOIN mexico_toy_store_wh_db.products_tbl p
        ON s.Product_ID = p.Product_ID
    GROUP BY
        STR_TO_DATE(s.`Date`, '%Y-%m-%d'),
        s.Store_ID
),

store_static AS (
    SELECT
        Store_ID,
        Store_City,
        Store_Location,
        STR_TO_DATE(Store_Open_Date, '%Y-%m-%d') AS store_open_date
    FROM mexico_toy_store_wh_db.stores_tbl
)

SELECT
    sds.date,
    sds.Store_ID,
    sds.store_units_sold,
    sdp.avg_product_price,
    ss.Store_City,
    ss.Store_Location,
    ss.store_open_date
FROM store_daily_sales sds
LEFT JOIN store_daily_price sdp
    ON sds.date = sdp.date
   AND sds.Store_ID = sdp.Store_ID
LEFT JOIN store_static ss
    ON sds.Store_ID = ss.Store_ID
-- WHERE sdp.Store_ID = 2
ORDER BY sds.Store_ID, sds.date;
