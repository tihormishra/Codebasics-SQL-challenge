select
c.customer_code,
c.customer,
pr.pre_invoice_discount_pct as average_discount_percentage
from dim_customer c
join fact_pre_invoice_deductions pr
on c.customer_code = pr.customer_code
where pre_invoice_discount_pct >
(select round(avg(pre_invoice_discount_pct),2)  from fact_pre_invoice_deductions) and
fiscal_year = 2021 and market = "India"
order by pre_invoice_discount_pct desc
limit 5;