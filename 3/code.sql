-- Section1
SELECT c.name, c.phone FROM customers c
JOIN orders o ON c.id = o.customer_id
GROUP BY c.id
ORDER BY COUNT(DISTINCT o.restaurant_food_id) DESC
LIMIT 1;

-- Section2
SELECT rf.food_id AS id, f.name
FROM restaurant_foods rf
JOIN foods f ON rf.food_id = f.id
LEFT JOIN orders o ON rf.id = o.restaurant_food_id
GROUP BY rf.food_id, f.name
ORDER BY AVG(o.rate) DESC, rf.food_id
LIMIT 10;

-- Section3
SELECT r.id, r.name
FROM restaurants r
LEFT JOIN restaurant_foods rf ON r.id = rf.restaurant_id
LEFT JOIN orders o ON rf.id = o.restaurant_food_id
GROUP BY r.id, r.name
ORDER BY AVG(o.rate) DESC, r.id
LIMIT 10;

-- Section4
SELECT c.name, c.phone
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN restaurant_foods rf ON o.restaurant_food_id = rf.id
GROUP BY c.name, c.phone
HAVING COUNT(DISTINCT rf.restaurant_id) >= 5
ORDER BY c.name
LIMIT 10;
