select 
case when month(date) in (9,10,11) then "Q1"
     when month(date) in (12,1,2) then "Q2"
     when month(date) in (3,4,5) then "Q3"
     else "Q4" end as Quarter,
sum(sold_quantity) as total_quantity
from fact_sales_monthly
where fiscal_year = '2020'
group by 1
order by 2 desc;