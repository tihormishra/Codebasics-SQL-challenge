With Cte as 
(select
segment,
count(distinct case when fiscal_year = 2020 then p.product_code end) as product_count_2020,
count(distinct case when fiscal_year = 2021 then p.product_code end) as product_count_2021
from dim_product p
join fact_gross_price g
on g.product_code = p.product_code
group by segment)

select segment,product_count_2020,product_count_2021,
(product_count_2021-product_count_2020) as difference
from cte

order by product_count_2021 desc;
