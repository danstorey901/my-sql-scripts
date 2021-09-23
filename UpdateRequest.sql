Update Requests Set
	Total = 
	(select Sum(rl.quantity * p.price)
			from Requests r
				join Requestlines rl
			on rl.RequestId = r.Id)
			from
				join
			on 
