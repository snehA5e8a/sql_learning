-- top 3 and bottom 3 makers for the fiscal years 2023 and 2024 in 
-- terms of the number of 2-wheelers sold.


WITH Ranked_Data as 
(SELECT Fyear, maker, total_sales, 
RANK() OVER (PARTITION BY Fyear ORDER BY total_sales DESC) as desc_rank,  
RANK() OVER (PARTITION BY Fyear ORDER BY total_sales ASC) as reverse_Rank  
FROM 
(SELECT 
  dim_date.fiscal_year as Fyear,
  electric_vehicle_sales_by_makers.maker AS maker,
  SUM(electric_vehicle_sales_by_makers.electric_vehicles_sold) AS total_sales
FROM 
  electric_vehicle_sales_by_makers
INNER JOIN dim_date ON dim_date.date = electric_vehicle_sales_by_makers.date
WHERE 
  electric_vehicle_sales_by_makers.vehicle_category = '2-Wheelers' 
GROUP BY 
  Fyear, maker
  order by Fyear, total_sales DESC) as fiscal_2wheelr_makers)

select Fyear, Maker, total_sales
from ranked_Data
where desc_rank <= 3 or reverse_Rank <=3
order by Fyear, desc_rank;