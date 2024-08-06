-- List the states with negative penetration (decline) in EV sales from 2022 to 2024
-- data mistake

SELECT * FROM 
(
SELECT state, sum(ev_2024) AS E24, sum(ev_2022) AS E22
FROM
(
SELECT
electric_vehicle_sales_by_state.state as state, 
CASE WHEN dim_date.fiscal_year = 2024
THEN 
((sum(electric_vehicle_sales_by_state.electric_vehicles_sold)/
sum(electric_vehicle_sales_by_state.total_vehicles_sold))*10000) 
END AS ev_2024, 
CASE WHEN dim_date.fiscal_year = 2022 
THEN 
((sum(electric_vehicle_sales_by_state.electric_vehicles_sold)/
sum(electric_vehicle_sales_by_state.total_vehicles_sold))*10000) 
END AS ev_2022
from electric_vehicle_sales_by_state
join dim_date
on dim_date.date = electric_vehicle_sales_by_state.date
group by state, dim_date.fiscal_year) AS A
GROUP BY STATE
)AS B
WHERE E24 > E22
ORDER BY E24;

