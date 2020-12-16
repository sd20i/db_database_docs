CREATE DEFINER=`master`@`%` PROCEDURE `SP_NEW_ORDER`(IN customer_fk INT)
BEGIN
	INSERT INTO orders(o_tracking_number, createdAt, customer_fk) VALUES (uuid(), now(), customer_fk);
END