-- Analyze the cumulative revenue generated over time.
SELECT order_date, 
SUM(daily_revenue) OVER(ORDER BY order_date) AS cumulative_revenue
FROM
(SELECT 
    orders.order_date,
    (ROUND(SUM(pizzas.price * order_details.quantity),
            0)) AS daily_revenue
FROM
    orders
        JOIN
    order_details ON order_details.order_id = orders.order_id
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id
GROUP BY orders.order_date) as day_revenue;