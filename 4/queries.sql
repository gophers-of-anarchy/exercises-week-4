-- Section1
    create index created_at_index
    on orders (created_at, total);
-- Section2
    create index index_name
    on orders (user_id, created_at, total);
-- Section3
    WITH recursive dates AS (
        SELECT (SELECT DATE(MIN(o.created_at)) from orders o) AS date
        UNION ALL
        SELECT date + INTERVAL 1 DAY
        FROM dates
        WHERE date < (SELECT DATE(MAX(o.created_at)) from orders o)
    )
    SELECT
        d.date AS created_at,
        COALESCE(o.total, 0.00) AS total
    FROM dates d
        LEFT JOIN (
            SELECT
                DATE(created_at) AS date,
                SUM(total) AS total
            FROM orders
            GROUP BY date
            ORDER BY date
    ) o ON d.date = o.date;