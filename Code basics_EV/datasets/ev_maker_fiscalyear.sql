-- top 3 and bottom 3 makers for the fiscal years 2023 and 2024 in 
-- terms of the number of 2-wheelers sold.

with top_3 as (select * from
(select dim_date.fiscal_year as fiscal_year, 
electric_vehicle_sales_by_makers.maker as ev_maker, 
(sum(electric_vehicle_sales_by_makers.electric_vehicles_sold)) as ev_sold
from 
dim_date join
electric_vehicle_sales_by_makers
on 
dim_date.date = electric_vehicle_sales_by_makers.date
group by fiscal_year, ev_maker) as data_Ev
order by ev_sold desc limit 3),
bottom_3 as (select * from
(select dim_date.fiscal_year as fiscal_year, 
electric_vehicle_sales_by_makers.maker as ev_maker, 
(sum(electric_vehicle_sales_by_makers.electric_vehicles_sold)) as ev_sold
from 
dim_date join
electric_vehicle_sales_by_makers
on 
dim_date.date = electric_vehicle_sales_by_makers.date
group by fiscal_year, ev_maker) as data_Ev
order by ev_sold asc limit 3)
SELECT * FROM Top_3
UNION ALL
SELECT * FROM Bottom_3;
