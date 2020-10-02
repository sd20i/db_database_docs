CREATE DATABASE  IF NOT EXISTS Car_Builder;

CREATE TABLE Manufacturer (
  manufacturer_id     int(10) NOT NULL AUTO_INCREMENT, 
  manufacturername varchar(255), 
  PRIMARY KEY (manufacturer_id));
  
  CREATE TABLE FuelType (
  fuel_id     int(10) NOT NULL AUTO_INCREMENT, 
  fuelname varchar(255), 
  PRIMARY KEY (fuel_id));
  
CREATE TABLE EngineMotor (
  engine_id                   int(10) NOT NULL AUTO_INCREMENT, 
  modelname                varchar(255), 
  price                       double, 
  fuel_id          int(10) NOT NULL, 
  manufacturer_id int(10) NOT NULL, 
  PRIMARY KEY (engine_id),
  FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id),
  FOREIGN KEY (fuel_id) REFERENCES FuelType(fuel_id));
  
CREATE TABLE BodyType (
  body_id                     int(10) NOT NULL AUTO_INCREMENT, 
  bodytypename                varchar(255), 
  price                       double, 
  manufacturer_id int(10) NOT NULL, 
  PRIMARY KEY (body_id),
  FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id));

CREATE TABLE Spoiler (
  spoiler_id                  int(10) NOT NULL AUTO_INCREMENT, 
  spoilername              varchar(255), 
  price                       double, 
  manufacturer_id int(10) NOT NULL, 
  PRIMARY KEY (spoiler_id),
  FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id));
  
  CREATE TABLE Color (
  color_id     int(10) NOT NULL AUTO_INCREMENT, 
  colorname varchar(255), 
  PRIMARY KEY (color_id));
CREATE TABLE Wheels (
  wheel_id                    int(10) NOT NULL AUTO_INCREMENT, 
  wheelname                varchar(255), 
  price                       double, 
  wheelSize                      varchar(255), 
  manufacturer_id int(10) NOT NULL, 
  PRIMARY KEY (wheel_id),
  FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id));
  
CREATE TABLE Windows (
  window_id                   int(10) NOT NULL AUTO_INCREMENT, 
  windowname               varchar(255), 
  price                       double, 
  manufacturer_id int(10) NOT NULL, 
  PRIMARY KEY (window_id),
  FOREIGN KEY (manufacturer_id) REFERENCES Manufacturer(manufacturer_id));
  
  CREATE TABLE Orders (
  order_id           int(10) NOT NULL AUTO_INCREMENT, 
  total              double, 
  bodytype_id int(10) NOT NULL, 
  window_id    int(10) NOT NULL, 
  wheel_id     int(10) NOT NULL, 
  color_id      int(10) NOT NULL, 
  engine_id      int(10) NOT NULL, 
  orderdate       date, 
  trackingnumber     int(10), 
  PRIMARY KEY (order_id),
  FOREIGN KEY (bodytype_id) REFERENCES BodyType(body_id),
  FOREIGN KEY (window_id) REFERENCES Windows(window_id),
  FOREIGN KEY (wheel_id) REFERENCES Wheels(wheel_id),
  FOREIGN KEY (color_id) REFERENCES Color(color_id),
  FOREIGN KEY (engine_id) REFERENCES EngineMotor(engine_id));
  
CREATE TABLE Customer (
  customer_id     int(10) NOT NULL AUTO_INCREMENT, 
  customername varchar(255), 
  order_id   int(10) NOT NULL, 
  PRIMARY KEY (customer_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id));


