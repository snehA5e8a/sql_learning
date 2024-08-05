-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT 
    ROUND(AVG(pizza_orders), 0) as avg_daily_pizza
FROM
    (SELECT 
        DATE(orders.order_date) AS order_Date,
            SUM(order_details.quantity) AS pizza_orders
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY order_Date) AS pizza_per_Day;