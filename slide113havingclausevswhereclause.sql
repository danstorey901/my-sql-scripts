select city, count(*), sum(sales)
	from customers
	where sales >20000
	group by city
	having sum(sales) > 600000;