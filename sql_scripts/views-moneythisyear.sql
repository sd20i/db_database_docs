CREATE VIEW v_money_thisyear as 
SELECT sum(p.p_price) as money_made_thisyear
FROM orders as o 
LEFT JOIN orderitems as oi
ON o.o_id = oi.order_fk
LEFT JOIN products as p
ON p.p_id = oi.product_fk
WHERE year(o.createdAt) = year(now())  
