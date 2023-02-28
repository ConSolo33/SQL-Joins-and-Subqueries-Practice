-- Question 1: There are 5 customers listed from Texas.
select customer.first_name, customer.last_name, customer_id, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';

-- Question 2: Listed full name of customers with payments greater than 6.99
select customer.first_name, customer.last_name, amount
from customer 
full join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- Question 3: There is one customer that made a payment over 175$.
select first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment
	group by amount, customer_id  
	having amount > 175
);

-- Question 4: There is one customer that lives in Nepal.
select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id 
where country = 'Nepal';

-- Question 5: Mike Hillyer had the most transactions.
select first_name, last_name
from staff
where staff_id in (
	select staff_id 
	from rental
	group by staff_id
	order by count(rental_id) desc
);

-- Question 6:  There are 178 rated G movies, 194 PG movies, 223 PG-13 movies, 196 R movies, and 209 NC-17 movies.      
select distinct(rating), count(film_id) 
from film
group by rating;


--Question 7: There are no customers that have made only one payment above $6.99, there are many that have made multiple payments above $6.99.
select first_name, last_name
from customer 
where customer_id in (
	select customer_id from payment
	group by customer_id
	having count(amount > 6.99) = 1
);

-- Question 8:  There were no free rentals given away. 
select count(rental_id)
from payment
where amount = 0;

