select city, count(*), sum(sales)
	from customers
	group by city