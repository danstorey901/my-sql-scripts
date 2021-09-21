--all customers with sales numbers less than average of all customer sales, descending order

select *
	from Customers c
	where sales < (select avg(Sales)
					from Customers)
	order by sales desc;
