/*===================================================
 SHIP OF LEARNING : Amazon 
 TOPIC: Find All Pairs of Products That Belong 
        to the Same Category
===================================================*/
SELECT * FROM PRODUCTS

SELECT
    P1.product_name AS PRODUCT1,
    P2.product_name AS PRODUCT2
FROM products P1
JOIN products P2
ON P1.category_id = P2.category_id AND
    P1.product_id < P2.product_id