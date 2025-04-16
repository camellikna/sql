-- Homework 2 : Basic SQL
-- SELECT
SELECT * 
FROM customer

SELECT * 
FROM customer 
ORDER BY customer_last_name , customer_first_name
LIMIT 10;



-- WHERE
SELECT *
FROM customer_purchases
WHERE product_id IN (4,9)

SELECT * , (quantity*cost_to_customer_per_qty) as price
FROM customer_purchases
WHERE vendor_id BETWEEN 8 AND 10



--CASE
SELECT product_id,product_name,
(CASE
	WHEN product_qty_type = 'unit' THEN 'unit'
	ELSE 'bulk'
END) AS prod_qty_type_condensed
FROM product

SELECT product_id,product_name,
(CASE
	WHEN product_qty_type = 'unit' THEN 'unit'
	ELSE 'bulk'
END) AS prod_qty_type_condensed ,
(CASE
	WHEN LOWER(product_name) Like '%pepper%' THEN 1
	ELSE 0
END) AS pepper_flag

FROM product



-- JOIN
SELECT * FROM vendor as V
INNER JOIN vendor_booth_assignments as A
ON A.vendor_id=V.vendor_id
ORDER BY V.vendor_name , A.market_date







