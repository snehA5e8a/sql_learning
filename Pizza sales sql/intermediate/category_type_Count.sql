-- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    pizza_types.category, COUNT(*) as count
FROM
    pizza_types
GROUP BY pizza_types.category
order by count;