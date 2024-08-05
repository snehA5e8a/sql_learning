-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(orders.order_time) AS order_hour,
    COUNT(orders.order_id) AS order_count
FROM
    orders
GROUP BY order_hour;