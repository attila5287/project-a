select distinct
	first_name,
    last_name
from
	customer
where
	customer_id in
    (
	select
		customer_id
	from
		rental
	where
		inventory_id in
		(
		select
			inventory_id
		from
			inventory
		where
			film_id in 
			(
			select
				film_id
			from
				film
			where
				title = "Blanket Beverly"
			)
		)
	)
;

select distinct
	c.first_name,
    c.last_name
from
	customer c
    inner join rental r on c.customer_id = r.customer_id
    inner join inventory i on r.inventory_id = i.inventory_id
    inner join film f on f.film_id = i.film_id
where
	f.title = 'Blanket Beverly'
;
    