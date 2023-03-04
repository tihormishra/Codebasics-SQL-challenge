With Cte as 
(select
sum(case when fiscal_year = 2020 then 1 else 0 end) as unique_products_2020,
sum(case when fiscal_year = 2021 then 1 else 0 end) as unique_products_2021
from fact_gross_price)
select unique_products_2020,unique_products_2021,
round((unique_products_2021-unique_products_2020)/unique_products_2020 * 100 ,2) as percentage_chg
from cte;