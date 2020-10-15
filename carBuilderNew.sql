drop database carBuilder;
create database carBuilder;
use carBuilder;

drop table if exists customers;
drop table if exists manufacturers;
drop table if exists productType;
drop table if exists products;
drop table if exists stock;
drop table if exists orders; 
drop table if exists orderItems;


create table customers(
	c_id int primary key auto_increment,
    c_name varchar(40) not null,
    c_phone varchar(15) not null,
    c_email varchar(150) not null,
    c_number int(3) not null,
    c_floor int(3),
    c_street varchar(100) not null,
    c_zip varchar(4) not null,
    c_city varchar(50) not null,
    c_country varchar(50) not null
);

create table manufacturers(
	m_id int primary key auto_increment,
    m_name varchar(50),
    m_country varchar(50)
);

create table productType(
	pt_id int primary key auto_increment,
    pt_name varchar(60)
);

create table products(
	p_id int primary key auto_increment,
    p_model_name varchar(30) not null,
    p_price float(50) not null,
    p_description text not null,
    product_type_fk int,
    CONSTRAINT FOREIGN KEY (product_type_fk) REFERENCES productType(pt_id),
    manufacturer_fk int,
    CONSTRAINT FOREIGN KEY (manufacturer_fk) REFERENCES manufacturers(m_id)
);

create table stock(
	s_id int primary key auto_increment,
    s_size varchar(20),
    s_color_name varchar(20),
    s_color_hex varchar(10),
    product_fk int,
    CONSTRAINT FOREIGN KEY (product_fk) REFERENCES products(p_id)
);

create table orders(
	o_id int primary key auto_increment,
    o_tracking_number varchar(30),
    o_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_fk int,
    CONSTRAINT FOREIGN KEY (customer_fk) REFERENCES customers(c_id)
);

create table orderItems(
	s_id int primary key auto_increment,
    order_fk int,
    product_fk int,
    CONSTRAINT FOREIGN KEY (order_fk) REFERENCES orders(o_id),
    CONSTRAINT FOREIGN KEY (product_fk) REFERENCES products(p_id)
);

-- customer data
insert into customers (c_name, c_phone, c_email, c_number, c_floor, c_street, c_zip, c_city, c_country) values 
('John Doe', '0045 239482712','john@email.com', 23, 3, 'Strandvejen', 2309, 'København', 'Denmark'),
('Lotte hansen', '0045 993237482','lotte@hotmail.com', 10, null, 'valbylanggade', 3302, 'København', 'Denmark'),
('Hanne hansen', '0045 82736438','ha@hansen.com', 1, 19, 'frederkisborgs vej', 2200, 'København', 'Denmark');

-- manufacturers data
insert into manufacturers (m_name, m_country) values
('Yamaha','Japan'),
('Universal', 'UK'),
('Nissan', 'Japan'),
('Goodyear', 'Us'),
('BBS', 'Us'),
('Michelin', 'France'),
('Volkswagen', 'Germany');

-- productType
insert into productType (pt_name) values 
('Car body'),
('Tires'),
('Wheels'),
('Engine'),
('Spoiler'),
('Windows'),
('Color');

-- products
insert into products (p_model_name, p_price, p_description, product_type_fk, manufacturer_fk) values 
('Sedan', 23.49, 'some description of this product', 1, 4),
('SUV', 200.38, 'suv description', 1, 3),
('Compact', 2032.28, 'compact car', 1, 3),
('Wagon', 19999.00, 'wagon text', 1, 1),
('Van', 123483.00, 'creapy white van', 1, 5),
('Pickup', 2283.00, 'car for picking up girls', 1, 5),
('Sport', 2273.99, 'midlife crises car type', 1, 3);

-- stock
insert into stock (s_size, s_color_name, s_color_hex, product_fk) values 
(null, 'Black', '#000', 1),
(null, 'White', '#FFF', 1),
(null, 'red', '#F00', 1),
(null, 'Black', '#000', 2),
(null, 'White', '#FFF', 2),
(null, 'red', '#F00', 2),
(null, 'Black', '#000', 3),
(null, 'White', '#FFF', 3),
(null, 'red', '#F00', 3),
(null, 'Black', '#000', 4),
(null, 'White', '#FFF', 4),
(null, 'red', '#F00', 4),
(null, 'Black', '#000', 6),
(null, 'White', '#FFF', 6),
(null, 'red', '#F00', 6),
(null, 'Black', '#000', 7),
(null, 'White', '#FFF', 7),
(null, 'red', '#F00', 7);