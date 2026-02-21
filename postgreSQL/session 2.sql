SELECT * FROM customers
WHERE city = 'Cairo';

-- 1
SELECT * FROM orders WHERE status ='Completed'
-- 2. Sort customers by signup_date (earliest first)
SELECT *
FROM customers
ORDER BY signup_date ASC;

-- 3. Sort products by price (cheapest first)
SELECT *
FROM products
ORDER BY price ASC;

-- 4. List unique cities
SELECT DISTINCT city
FROM customers
WHERE city IS NOT NULL;

-- 5. Find customers with NULL city
SELECT *
FROM customers
WHERE city IS NULL;

-- 6. Find products with NULL price
SELECT *
FROM products
WHERE price IS NULL;

-- 7. Count total orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- 8. Count orders per status
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- 9. Average product price
SELECT AVG(price) AS avg_product_price
FROM products;

-- 10. Max payment amount
SELECT MAX(amount) AS max_payment_amount
FROM payments;

-- 11. Number of customers per city
SELECT city, COUNT(*) AS customer_count
FROM customers
WHERE city IS NOT NULL
GROUP BY city;




SELECT c.customer_id , c.first_name , o.order_id
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;


-- 12. Show order items with product names
SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    oi.quantity
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;


-- Show customer name, order id, product name, quantity
SELECT
    c.first_name || ' ' || c.last_name AS customer_name,
    o.order_id,
    p.product_name,
    oi.quantity
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;



-- Find orders with no payment
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.order_id IS NULL;


-- Find customers who placed only one order
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS orders_count
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(o.order_id) = 1;


-- Find all mismatched orders & payments (orders without payments OR payments without orders)
SELECT
    o.order_id AS order_id,
    p.payment_id AS payment_id,
    o.customer_id,
    o.order_date,
    o.status,
    p.payment_method,
    p.amount,
    p.payment_date
FROM orders o
FULL OUTER JOIN payments p
ON o.order_id = p.order_id
WHERE o.order_id IS NULL   -- payments without matching orders
   OR p.order_id IS NULL;  -- orders without matching payments

