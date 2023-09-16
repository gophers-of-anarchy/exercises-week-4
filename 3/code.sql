
-- Section1
    SELECT c.name, c.phone FROM customers c
        JOIN orders o ON c.id = o.customer_id
    GROUP BY c.id
    ORDER BY COUNT(*) DESC
    LIMIT 1;
-- Section2
SELECT food.id, food.name FROM foods AS food
    JOIN restaurant_foods ON food_id=food.id
    JOIN orders ON restaurant_food_id=restaurant_foods.id
GROUP BY food.id ORDER BY AVG(rate) DESC, food.id ASC
LIMIT 10;
-- Section3
SELECT restaurants.id, restaurants.name FROM foods AS f
    JOIN restaurant_foods ON food_id=f.id
    JOIN orders ON orders.restaurant_food_id=restaurant_foods.id
GROUP BY restaurants.id
ORDER BY AVG(rate) DESC, restaurants.id ASC
LIMIT 10;
-- Section4
select customers.name, customers.phone from customers
inner join orders on customers.id = orders.customer_id
inner join restaurant_foods on orders.restaurant_food_id = restaurant_foods.id
GROUP BY customers.id, customers.name
having COUNT(distinct restaurant_id) > 4
ORDER BY customers.name