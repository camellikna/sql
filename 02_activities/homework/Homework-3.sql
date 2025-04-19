SELECT * FROM customer_purchases
-- Write a query that determines how many times each vendor has rented a booth at the farmer’s market by counting the vendor booth assignments per vendor_id.

SELECT vendor_id,COUNT(vendor_id) AS rented_time
FROM vendor_booth_assignments
GROUP BY vendor_id

-- The Farmer’s Market Customer Appreciation Committee wants to give a bumper sticker to everyone who has ever spent more than $2000
--  at the market. Write a query that generates a list of customers for them to give stickers to, sorted by last name, then first name. 
--  HINT: This query requires you to join two tables, use an aggregate function, and use the HAVING keyword.

SELECT c.customer_first_name,c.customer_last_name,SUM(cp.cost_to_customer_per_qty * cp.quantity) AS Spent
FROM customer c 
JOIN customer_purchases cp
ON c.customer_id = cp.customer_id
GROUP BY c.customer_last_name,c.customer_last_name
HAVING Spent > 2000
ORDER BY c.customer_last_name , c.customer_first_name

-- Temp Table
SELECT *
FROM vendor

CREATE TABLE temp.new_vendor AS
SELECT * FROM vendor

INSERT INTO temp.new_vendor(vendor_id,vendor_name,vendor_type,vendor_owner_first_name,vendor_owner_last_name)
VALUES ( 10 , 'Thomass Superfood Store', 'Fresh Focused', 'Thomas' , 'Rosenthal' )

SELECT *
FROM temp.new_vendor

-- date
-- Get the customer_id, month, and year (in separate columns) of every purchase in the customer_purchases table.
--  HINT: you might need to search for strfrtime modifers sqlite on the web to know what the modifers for month
--  and year are!

SELECT customer_id,
       strftime('%m' , market_date) AS Month,
	   strftime('%Y' , market_date) AS YEAR
FROM customer_purchases

-- Using the previous query as a base, determine how much money each customer spent in April 2022. 
-- Remember that money spent is quantity*cost_to_customer_per_qty. HINTS: you will need to AGGREGATE,
--  GROUP BY, and filter...but remember, STRFTIME returns a STRING for your WHERE statement!!

SELECT customer_id,
       SUM(quantity * cost_to_customer_per_qty) AS total_spent
FROM customer_purchases
WHERE strftime('%Y', market_date) = '2022'
  AND strftime('%m', market_date) = '04'
GROUP BY customer_id;


