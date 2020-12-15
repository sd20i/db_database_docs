DROP DATABASE IF EXISTS carbuilder;
CREATE DATABASE carbuilder;
USE carbuilder;
CREATE TABLE customers (
  c_id      int(11) NOT NULL AUTO_INCREMENT, 
  c_name    varchar(40) NOT NULL, 
  c_phone   varchar(15), 
  c_email   varchar(150) NOT NULL, 
  c_number  int(3), 
  c_floor   int(3), 
  c_street  varchar(100), 
  c_zip     varchar(4), 
  c_city    varchar(50), 
  c_country varchar(50), 
  c_fb_id   varchar(50) NOT NULL, 
  PRIMARY KEY (c_id)) AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
CREATE TABLE manufacturers (
  m_id      int(11) NOT NULL AUTO_INCREMENT, 
  m_name    varchar(50), 
  m_country varchar(50), 
  PRIMARY KEY (m_id)) AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
CREATE TABLE orderItems (
  oi_id      int(11) NOT NULL AUTO_INCREMENT, 
  order_fk   int(11), 
  product_fk int(11), 
  PRIMARY KEY (oi_id)) AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
CREATE TABLE orders (
  o_id              int(11) NOT NULL AUTO_INCREMENT, 
  o_tracking_number varchar(250), 
  createdAt         datetime NULL, 
  customer_fk       int(11), 
  PRIMARY KEY (o_id)) AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
CREATE TABLE products (
  p_id            int(11) NOT NULL AUTO_INCREMENT, 
  p_model_name    varchar(30) NOT NULL, 
  p_price         double NOT NULL, 
  p_description   text NOT NULL, 
  product_type_fk int(11), 
  manufacturer_fk int(11), 
  image           varchar(200), 
  PRIMARY KEY (p_id)) AUTO_INCREMENT = 17 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
CREATE TABLE productType (
  pt_id   int(11) NOT NULL AUTO_INCREMENT, 
  pt_name varchar(60), 
  PRIMARY KEY (pt_id)) AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
CREATE TABLE stock (
  s_id         int(11) NOT NULL AUTO_INCREMENT, 
  s_size       varchar(20), 
  s_color_name varchar(20), 
  s_color_hex  varchar(10), 
  product_fk   int(11), 
  PRIMARY KEY (s_id)) AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
CREATE TABLE CreditCards (
  cc_cridt_card_id  int(11) NOT NULL AUTO_INCREMENT, 
  cc_card_type      varchar(50) NOT NULL, 
  cc_holder_name    varchar(60) NOT NULL, 
  cc_card_number    varchar(25) NOT NULL, 
  cc_expiry_date    date NOT NULL, 
  cc_last_used_date date, 
  customersc_id     int(11) NOT NULL, 
  PRIMARY KEY (cc_cridt_card_id));
  
  CREATE TABLE customers_audit_log (
    c_id int NOT NULL,
    old_row_data JSON,
    new_row_data JSON,
    dml_type ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    dml_timestamp TIMESTAMP NOT NULL,
    dml_created_by VARCHAR(255) NOT NULL,
    PRIMARY KEY (c_id, dml_type, dml_timestamp)
);

CREATE INDEX order_fk 
  ON orderItems (order_fk);
CREATE INDEX product_fk 
  ON orderItems (product_fk);
CREATE INDEX customer_fk 
  ON orders (customer_fk);
CREATE INDEX product_type_fk 
  ON products (product_type_fk);
CREATE INDEX manufacturer_fk 
  ON products (manufacturer_fk);
CREATE INDEX product_fk 
  ON stock (product_fk);
ALTER TABLE orderItems ADD CONSTRAINT orderitems_ibfk_1 FOREIGN KEY (order_fk) REFERENCES orders (o_id);
ALTER TABLE orderItems ADD CONSTRAINT orderitems_ibfk_2 FOREIGN KEY (product_fk) REFERENCES products (p_id);
ALTER TABLE orders ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY (customer_fk) REFERENCES customers (c_id);
ALTER TABLE products ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (product_type_fk) REFERENCES productType (pt_id);
ALTER TABLE products ADD CONSTRAINT products_ibfk_2 FOREIGN KEY (manufacturer_fk) REFERENCES manufacturers (m_id);
ALTER TABLE stock ADD CONSTRAINT stock_ibfk_1 FOREIGN KEY (product_fk) REFERENCES products (p_id);
ALTER TABLE CreditCards ADD CONSTRAINT FKCreditCard102749 FOREIGN KEY (customersc_id) REFERENCES customers (c_id);


INSERT INTO `customers` VALUES (1,'John Doe','0045 239482712','john@email.com',23,3,'Strandvejen','2309','København','Denmark', '51sOp8ua4JZdyp3xCQDy3EhWHWl1'),(2,'Lotte hansen','0045 993237482','lotte@hotmail.com',10,NULL,'valbylanggade','3302','København','Denmark', '8HBFh10dVDSAz0Ud6Ppupbslhxo2'),(3,'Hanne hansen','0045 82736438','ha@hansen.com',1,19,'frederkisborgs vej','2200','København','Denmark', 'o38KangI2FNPKG8Sj4ki4eW8jsv1');
INSERT INTO `manufacturers` VALUES (1,'Yamaha','Japan'),(2,'Universal','UK'),(3,'Nissan','Japan'),(4,'Goodyear','Us'),(5,'BBS','Us'),(6,'Michelin','France'),(7,'Volkswagen','Germany');
INSERT INTO `orders` VALUES (1,'284nxcnd3iw','2020-11-18 12:06:22',1),(2,'84958ncHmMH034','2020-11-18 13:07:30',1),(3,'b39b8bb7-42c4-4b23-bd12-47824bd6eb1a','2020-11-18 13:14:25',1),(4,'4a4c786a-fa46-4c8f-a6a0-6ab7ccbc5a1a','2020-11-18 13:15:17',2);
INSERT INTO `productType` VALUES (1,'Car body'),(2,'Engine'),(3,'Tires'),(4,'Spoiler'),(5,'Windows');
INSERT INTO `products` VALUES (1,'Rally',203.49,'bla',3,3,'rally.png'),(2,'All terrain',203.49,'bla',3,3,'allterrain.png'),(3,'Offroad',23.49,'bla',3,1,'offroad.png'),(4,'Sedan',23.49,'some description of this product',1,4,'sedan.png'),(5,'SUV',200.38,'suv description',1,3,'suv.png'),(6,'Performance',2032.28,'compact car',1,3,'performance.png'),(7,'Hatchback',19999,'wagon text',1,1,'hatchback.png'),(8,'Spoiler',3273.99,'brian type of equipment',4,2,'placeholder.png'),(9,'Vintage',123483,'creapy white van',1,5,'vintage.png'),(12,'V8',2000,'some engine',2,1,'gas.png'),(13,'Electric',1000,'some engine',2,6,'electric.png'),(14,'v6',1700,'yet another engine',2,1,'gas.png'),(15,'Clear',120,'Clear window',5,3,'placeholder.png'),(16,'Tinted',340,'Tinted brian windows',5,7,'placeholder.png');
INSERT INTO `orderItems` VALUES (1,1,1),(2,1,4),(3,1,8);
INSERT INTO `stock` VALUES (1,NULL,'Black','#000',1),(2,NULL,'White','#FFF',1),(3,NULL,'red','#F00',1),(4,NULL,'Black','#000',2),(5,NULL,'White','#FFF',2),(6,NULL,'red','#F00',2),(7,NULL,'Black','#000',3),(8,NULL,'White','#FFF',3),(9,NULL,'red','#F00',3),(10,NULL,'Black','#000',4),(11,NULL,'White','#FFF',4),(12,NULL,'red','#F00',4),(13,NULL,'Black','#000',6),(14,NULL,'White','#FFF',6),(15,NULL,'red','#F00',6),(16,NULL,'Black','#000',7),(17,NULL,'White','#FFF',7),(18,NULL,'red','#F00',7);
INSERT INTO `creditcards` VALUES (1,'Visa','Name1','\'4485116753008572\'','2026-11-23','2020-08-14',1),(2,'MasterCard','Name2','\'5558411489160923\'','2025-10-08','2019-11-20',2),(3,'Visa Electron','Name3','\'4913094084239319\'','2024-09-09','2020-08-07',3),(4,'Visa Electron','Name4','\'4913094084239319\'','2024-09-09', null,3);

DELIMITER //
Create Procedure Update_product_default_image()
   BEGIN
   SET sql_safe_updates=0;
   UPDATE products
   SET
   image = "placeholder.png" where image is null;
   SET sql_safe_updates=1;
   END;
   //
   
 
Create Procedure ReturnAllEmails()
   BEGIN
   SELECT GROUP_CONCAT(c_email SEPARATOR ',') 
   FROM customers
   GROUP BY NULL;
	
   END;
   //
   

CREATE TRIGGER customer_insert_audit_trigger
AFTER INSERT ON customers FOR EACH ROW
BEGIN
    INSERT INTO customers_audit_log (
        c_id,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp,
        dml_created_by
    ) VALUES (
        NEW.c_id,
        null,
        JSON_OBJECT(
			"c_id", NEW.c_id,
			"c_name", NEW.c_name,
			"c_phone", NEW.c_phone,
			"c_email", NEW.c_email,
			"c_number", NEW.c_number,
			"c_floor", NEW.c_floor,
			"c_street", NEW.c_street,
			"c_zip", NEW.c_zip,
			"c_city", NEW.c_city,
			"c_country", NEW.c_country
        ),
        'INSERT',
        CURRENT_TIMESTAMP,
        CURRENT_USER()
    );
    END //

CREATE TRIGGER customer_update_audit_trigger	
AFTER UPDATE ON customers FOR EACH ROW
BEGIN
    INSERT INTO customers_audit_log (
        c_id,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp,
        dml_created_by
    ) VALUES (
        NEW.c_id,
        JSON_OBJECT(
			"c_id", OLD.c_id,
			"c_name", OLD.c_name,
			"c_phone", OLD.c_phone,
			"c_email", OLD.c_email,
			"c_number", OLD.c_number,
			"c_floor", OLD.c_floor,
			"c_street", OLD.c_street,
			"c_zip", OLD.c_zip,
			"c_city", OLD.c_city,
			"c_country", OLD.c_country
        ),
        JSON_OBJECT(
			"c_id", NEW.c_id,
			"c_name", NEW.c_name,
			"c_phone", NEW.c_phone,
			"c_email", NEW.c_email,
			"c_number", NEW.c_number,
			"c_floor", NEW.c_floor,
			"c_street", NEW.c_street,
			"c_zip", NEW.c_zip,
			"c_city", NEW.c_city,
			"c_country", NEW.c_country
        ),
        'UPDATE',
        CURRENT_TIMESTAMP,
        CURRENT_USER()
    );
    END //
	
CREATE TRIGGER customer_delete_audit_trigger	
AFTER DELETE ON customers FOR EACH ROW
BEGIN
    INSERT INTO customers_audit_log (
        c_id,
        old_row_data,
        new_row_data,
        dml_type,
        dml_timestamp,
        dml_created_by
    ) VALUES (
        OLD.c_id,
        JSON_OBJECT(
			"c_id", OLD.c_id,
			"c_name", OLD.c_name,
			"c_phone", OLD.c_phone,
			"c_email", OLD.c_email,
			"c_number", OLD.c_number,
			"c_floor", OLD.c_floor,
			"c_street", OLD.c_street,
			"c_zip", OLD.c_zip,
			"c_city", OLD.c_city,
			"c_country", OLD.c_country
        ),
		null,
        'DELETE',
        CURRENT_TIMESTAMP,
        CURRENT_USER()
    );
    END 
    //

CREATE TRIGGER delete_used_card
AFTER DELETE ON creditcards
FOR EACH ROW
BEGIN
IF OLD.cc_last_used_date IS NOT NULL THEN CALL cannot_delete_error;

END IF;
END;

//
DELIMITER //




