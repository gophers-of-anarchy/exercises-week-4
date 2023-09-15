-- Section1
select customers.name, customers.phone from customers
inner join orders on customers.id = orders.customer_id
GROUP BY customers.name, customers.phone
ORDER BY COUNT(orders.customer_id) DESC
LIMIT 1
-- Section2
select foods.id, foods.name from foods
inner join restaurant_foods on foods.id = restaurant_foods.food_id
inner join orders on restaurant_foods.id = orders.restaurant_food_id
GROUP BY foods.name, foods.id
ORDER BY AVG(orders.rate) DESC, foods.id
LIMIT 10
-- Section3
select restaurants.id, restaurants.name from restaurants
inner join restaurant_foods on restaurants.id = restaurant_foods.restaurant_id
inner join orders on restaurant_foods.id = orders.restaurant_food_id
GROUP BY restaurants.id, restaurants.name
ORDER BY AVG(orders.rate) DESC, restaurants.id
LIMIT 10
-- Section4
select customers.name, customers.phone from customers
inner join orders on customers.id = orders.customer_id
inner join restaurant_foods on orders.restaurant_food_id = restaurant_foods.id
GROUP BY customers.id, customers.name
having COUNT(distinct restaurant_id) > 4
ORDER BY customers.name