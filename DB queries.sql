SELECT * from actor;
SELECT * from address;
SELECT * from category;
SELECT * from city;
SELECT * from country;
SELECT * from customer_list;
SELECT * from customer;
SELECT * from film;
SELECT * from film_actor;
SELECT * from payment;
SELECT * from country ;
select distinct customer_id from customer;



-- 1.How many countries are in the database?
SELECT COUNT(*) 
AS countingCountries
FROM country;

/* 2.Return all the addresses from the district of 
"California" ordered by their corresponding phone numbers. */
SELECT address
FROM address
WHERE district = 'California'
ORDER BY phone ;

/* 3.Return the fullnames(first and last)of actors with “SON” 
in their last name, sorted by their firstname. */
SELECT concat(first_name, " ", last_name) as fullnames
FROM actor
WHERE last_name LIKE '%SON%'
ORDER BY first_name ASC;

/* 4.Return the title and the length of all the films which length 
is more than 184 (inclusive). Order the results by the length 
(and for films with the same length order them by their name). */

SELECT title, length
FROM film
WHERE length >= 184
ORDER BY length ASC, title ASC;


/* 5.What are the top 10 countries with most number of clients. */

SELECT COUNT(name) AS client_count, Country
FROM customer_list
GROUP BY country
ORDER BY COUNT(name) DESC
limit 10;

/* 6.Query for the customer who spent the most on rental movies? 
Return his/her customer id, first name and the amount spent. */

SELECT sum(payment.amount) AS MAX_AMOUNT_SPENT, customer.customer_id AS cool_customerID, first_name FROM payment
INNER JOIN customer
ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY MAX_AMOUNT_SPENT DESC
LIMIT 1;


/* 7.Return the name of the movie with the largest number of actors. */

SELECT COUNT(film_actor.film_id) AS NUMBER_OF_ACTORS, film.film_id, title
FROM film_actor
INNER JOIN film 
ON film.film_id = film_actor.film_id
GROUP BY film_actor.film_id
ORDER BY COUNT(NUMBER_OF_ACTORS) DESC
LIMIT 1;


/* 8.List the film id and titles of those films that are not in inventory. */ 

SELECT film_id, title
FROM Film
WHERE film_id NOT IN
(SELECT film_id FROM inventory)
ORDER BY title;


/* 9.Find a list of customers who have not rented a movie yet. */

SELECT customer_id, first_name
FROM customer
WHERE customer_id NOT IN 
(SELECT distinct customer_id from rental)
ORDER BY customer_id;


/* 10. Write an interesting query statement of your own,not shown in the questions. 
The query should include at least one join, HAVING clause and aggregation operation. 
Explanation your query statement and the answer. */

SELECT sum(payment.amount) AS MOST_SPENT, concat(first_name, " ", last_name) as fullNames
FROM payment
INNER JOIN customer 
ON   payment.customer_id = customer.customer_id
GROUP BY payment.customer_id
HAVING MOST_SPENT >= 200
ORDER BY MOST_SPENT DESC;




