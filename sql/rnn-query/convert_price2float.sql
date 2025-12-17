-- Price is static, it does not develop over time and is bound to product
SELECT
    Product_Price,
    REPLACE(Product_Price, '$', '') AS cleaned,
    CAST(REPLACE(Product_Price, '$', '') AS DECIMAL(10,2)) AS numeric_price
FROM mexico_toy_store_wh_db.products_tbl
LIMIT 10;
