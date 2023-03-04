SELECT monthname(m.date) as Month,year(m.date) as Year,
round(sum(g.gross_price * m.sold_quantity /1000000),2) as Gross_sales_in_Millions
 FROM fact_sales_monthly m
 join fact_gross_price g
 on m.product_code = g.product_code
 join dim_customer c
 on m.Customer_code = c.customer_code
 where customer = "Atliq Exclusive"
 group by m.date
 order by year;