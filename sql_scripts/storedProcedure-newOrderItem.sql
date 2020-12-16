CREATE PROCEDURE `SP_NEW_ORDERITEM` (IN product_fk INT, IN order_fk INT)
BEGIN
	INSERT INTO orderitems(order_fk, product_fk) VALUES (order_fk, product_fk);
END
