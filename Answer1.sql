SELECT market as Markets
FROM gdb023.dim_customer
where customer="Atliq Exclusive"
and region = "APAC"
group by market
order by market asc;