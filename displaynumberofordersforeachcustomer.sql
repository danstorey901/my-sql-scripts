-- display the number of orders for each customer + having clause

select c.Name, count(*) as Orders
	from customers c
	join orders o
	on o.CustomerId = c.Id
		group by c.id, c.Name
		--customers with more than 1 order, use the having clause
		having count(*) > 1