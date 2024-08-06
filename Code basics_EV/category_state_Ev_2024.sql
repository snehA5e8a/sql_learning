-- Identify the top 5 states with the highest penetration rate in 2-wheeler 
-- and 4-wheeler EV sales in FY 2024.
-- penetration = ev/total

WITH ranked_states as 
(select veh_category, state, ev_penetration, 
rank() over (partition by veh_category order by ev_penetration desc) as state_rank
from
(SELECT electric_vehicle_sales_by_state.vehicle_category as veh_category, 
electric_vehicle_sales_by_state.state as state,
round(((sum(electric_vehicle_sales_by_state.electric_vehicles_sold)/
sum(electric_vehicle_sales_by_state.total_vehicles_sold))*100), 2) as ev_penetration
from electric_vehicle_sales_by_state
join dim_date
on dim_date.date = electric_vehicle_sales_by_state.date
where dim_date.fiscal_year = 2024
group by veh_category, state
order by veh_category, ev_penetration DESC) as cat_state)

SELECT veh_category, state, ev_penetration 
from ranked_states
where state_rank <=5; 
