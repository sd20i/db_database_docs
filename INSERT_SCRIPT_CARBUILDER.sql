INSERT INTO Customer (customername )
VALUES ('Billy Joel'), ('Joey Diaz');

INSERT INTO Manufacturer (manufacturername)
VALUES ('BMW'), ('Universal'), ('Dodge'), ('Big Country Labs'), ('APR Performance'), ('Duraflex'),
       ('Daimler'), ('FCA'), ('Racing Ultraleggera'), ('GM'), ('Hyundai'), ('Honda'),
       ('American Racing'), ('ENKEI'), ('BBS'), ('SSR'), ('Konig'), ('Forgiato'),
       ('Carbon Revolution'), ('Porsche'), ('Chevrolet'), ('Nissan '), ('MINI Cooper '),
       ('Nissan '), ('Mercedes'), ('Volkswagen'), ('Ferrari'), ('Ford'), ('Subaru');
       
INSERT INTO FuelType (fuelname)
VALUES ('Diesel'), ('Gasoline'), ('Biodiesel'), ('Hybrid'), ('Electric');      
       
INSERT INTO EngineMotor (modelname, price, fuel_id, manufacturer_id)
VALUES ('BMW', 4500, 1, 1);
       
INSERT INTO BodyType (bodytypename, price, manufacturer_id)
VALUES ('Porsche Cayenne',11000, 20), ('Chevrolet Camaro', 19000, 21), ('Nissan 370Z', 5000, 24), ('Nissan Skyline', 33000, 24), 
	   ('MINI Cooper', 10000, 23), ('Mercedes CL', 68000, 25), ('Volkswagen Jetta', 44000, 26), ('Ferrari 458', 99000, 27),
       ('Ford Mustang V6 RS', 48900, 28), ('Subaru BRZ', 52000, 29);

INSERT INTO Spoiler (spoilername, price, manufacturer_id)
VALUES ('ATMOSPHERE DEMOLISHER - COMPLETE KIT',8000, 2), ('Type S Adjustable Angle Silver Double-Deck Aluminum GT Style Spoiler', 19000, 2),
		('Challenger Factory-Style Spoiler', 5000, 3), ('Subaru BRZ and Scion FR-S Air Demolisher Spoiler', 4000, 4), 
	    ('GT-250 Spoiler for Scion FR-S and Subaru BRZ', 1000, 5), ('GT500 Rear Spoiler for Subaru BRZ', 68000, 6), 
        ('FC3 RX-7 Carbon Fiber Atmosphere Demolisher Spoiler', 6700, 4);
        
INSERT INTO Color (colorname, colorhex)
VALUES ('Black', '#000'), ('White', '#FFF'), ('Red', '#F00');

INSERT INTO Wheels (wheelname, price, wheelSize, manufacturer_id)
VALUES ('Racing Ultraleggera', 860, '20 inches', 9), ('Torq Thrust', 860, '18 inches', 13), ('RP03', 1500, '22 inches', 14),
		('SUPER RS', 2400, '22 inches', 15), ('GTV01', 550, '24 inches', 16), ('Hypergram', 3600, '22 inches', 17), ('Forgiato', 470, '20 inches', 18)
        ,('CR9', 3200, '30 inches', 19);
        
INSERT INTO Windows (windowname, price, manufacturer_id)
VALUES ('Normal Laminated Glass',5000, 4), ('Tinted Laminated Glass', 9000, 11), ('Tinted Tempered Glass', 5000, 7), ('Tinted Bulletproof Glass', 10000, 8), 
	   ('Normal Bulletproof Glass', 9000, 20);
       BodyTypebody_id
insert into Orders (total, bodytype_id, window_id, wheel_id, color_id, engine_id, orderdate, trackingnumber) 
values (4500.00, 3, 1, 4, 1, 1, '2020-7-04', 4545451);