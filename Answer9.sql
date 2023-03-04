With CTE as 
(SELECT channel,
round(sum(g.gross_price * m.sold_quantity) /1000000,2) as Gross_sales_in_Millions
 FROM fact_sales_monthly m
 join fact_gross_price g
 on m.product_code = g.product_code
 join dim_customer c
 on m.Customer_code = c.customer_code
 where m.fiscal_year = 2021
 group by channel)
 
 select channel, Gross_sales_in_millions,
 round((gross_sales_in_millions/(select sum(gross_sales_in_millions)
 from CTE) * 100),2) as percentage 
 from CTE
 group by channel
 order by gross_sales_in_millions desc;