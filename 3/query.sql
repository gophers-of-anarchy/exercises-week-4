-- Section1
SELECT c.name, c.phone FROM customers c
JOIN orders o on c.id = o.customer_id
GROUP BY c.id
ORDER BY count(*) DESC
LIMIT 1;

-- Section2
WITH avg_ratings AS (
    SELECT f.*, AVG(o.rate) AS rate
    FROM foods f
    JOIN restaurant_foods rf ON f.id = rf.food_id
    JOIN orders o ON rf.id = o.restaurant_food_id
    GROUP BY rf.food_id
)
SELECT id, name
FROM avg_ratings
ORDER BY avg_ratings.rate DESC, avg_ratings.id limit 10;

-- Section3
WITH avg_ratings AS (
    SELECT r.id, r.name, AVG(o.rate) rate 
    FROM restaurants r
    JOIN restaurant_foods rf ON r.id = rf.restaurant_id
    JOIN orders o ON rf.id = o.restaurant_food_id
    GROUP BY r.id
)
SELECT id, name
FROM avg_ratings
ORDER BY avg_ratings.rate DESC, avg_ratings.id LIMIT 10;

-- Section4
SELECT c.name, c.phone FROM customers c
    JOIN orders o ON c.id = o.customer_id
    JOIN restaurant_foods rf ON rf.id = o.restaurant_food_id
GROUP BY c.id
HAVING count(DISTINCT rf.restaurant_id) >= 5
ORDER BY c.name;
