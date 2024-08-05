-- Identify the most common pizza size ordered.
SELECT 
    pizzas.size,
    sum(order_details.quantity) AS size_quantity 
    -- sum: total quantities ordered, count: total orders 
FROM
    pizzas
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY size_quantity DESC;