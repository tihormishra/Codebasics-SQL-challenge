With CTE as 
(select p.division,
 sum(sold_quantity) as total_sold_quantity,
 dense_rank() over (partition by division order by
 sum(sold_quantity) desc) as rank_order
 from fact_sales_monthly m
 join dim_product p
 on m.product_code = p.product_code
 where m.fiscal_year = 2021
 group by p.division, m.product_code)
 
 select p.product,m.product_code
 from cte
 where rank_order <=3
 group by division;
 