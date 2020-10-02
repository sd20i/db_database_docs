INSERT INTO Manufacturer
VALUES (1 , 'BMW'), (2 , 'Universal'), (3 , 'Dodge'), (4 , 'Big Country Labs'), (5 , 'APR Performance'), (6 , 'Duraflex'),
       (7 , 'Daimler'), (8 , 'FCA'), (9 , 'Racing Ultraleggera'), (10 , 'GM'), (11 , 'Hyundai'), (12 , 'Honda'),
       (13 , 'American Racing'), (14 , 'ENKEI'), (15 , 'BBS'), (16 , 'SSR'), (17 , 'Konig'), (18 , 'Forgiato'),
       (19 , 'Carbon Revolution'), (20 , 'Porsche'), (21 , 'Chevrolet'), (22 , 'Nissan '), (23 , 'MINI Cooper '),
       (24 , 'Nissan '), (25 , 'Mercedes'), (26 , 'Volkswagen'), (27 , 'Ferrari'), (28 , 'Ford'), (29 , 'Subaru');
       
INSERT INTO FuelType
VALUES (1 , 'Diesel'), (2 , 'Gasoline'), (3 , 'Biodiesel'), (4 , 'Hybrid'), (5 ,'Electric');      
       
INSERT INTO EngineMotor
VALUES (1 , 'BMW', 4500, 1, 1), (2 , 'Daimler', 500, 4, 7), (3 , 'FCA', 2500, 2, 8), (4 , 'GM', 2100, 2, 10), (5 ,'Hyundai', 700, 5, 11), (6 ,'Honda', 9000, 4, 12);      
       
INSERT INTO BodyType
VALUES (1 , 'Porsche Cayenne',11000, 20), (2 , 'Chevrolet Camaro', 19000, 21), (3 , 'Nissan 370Z', 5000, 24), (4 , 'Nissan Skyline', 33000, 24), 
	   (5 , 'MINI Cooper', 10000, 23), (6 , 'Mercedes CL', 68000, 25), (7 , 'Volkswagen Jetta', 44000, 26), (8 , 'Ferrari 458', 99000, 27),
       (9 , 'Ford Mustang V6 RS', 48900, 28), (10 , 'Subaru BRZ', 52000, 29);

INSERT INTO Spoiler
VALUES (1 , 'ATMOSPHERE DEMOLISHER - COMPLETE KIT',8000, 2), (2 , 'Type S Adjustable Angle Silver Double-Deck Aluminum GT Style Spoiler', 19000, 2),
		(3 , 'Challenger Factory-Style Spoiler', 5000, 3), (4 , 'Subaru BRZ and Scion FR-S Air Demolisher Spoiler', 4000, 4), 
	    (5 , 'GT-250 Spoiler for Scion FR-S and Subaru BRZ', 1000, 5), (6 , 'GT500 Rear Spoiler for Subaru BRZ', 68000, 6), 
        (7 , 'FC3 RX-7 Carbon Fiber Atmosphere Demolisher Spoiler', 6700, 4);
        
INSERT INTO Color
VALUES (1 , 'Black'), (2 , 'White'), (3 , 'Red');

INSERT INTO Wheels
VALUES (1 , 'Racing Ultraleggera', 860, '20 inches', 9), (2 , 'Torq Thrust', 860, '18 inches', 13), (3 , 'RP03', 1500, '22 inches', 14),
		(4 , 'SUPER RS', 2400, '22 inches', 15), (5 , 'GTV01', 550, '24 inches', 16), (6 , 'Hypergram', 3600, '22 inches', 17), (7 , 'Forgiato', 470, '20 inches', 18)
        , (8 , 'CR9', 3200, '30 inches', 19);
        
INSERT INTO Windows
VALUES (1 , 'Normal Laminated Glass',5000, 4), (2 , 'Tinted Laminated Glass', 9000, 11), (3 , 'Tinted Tempered Glass', 5000, 7), (4 , 'Tinted Bulletproof Glass', 10000, 8), 
	   (5 , 'Normal Bulletproof Glass', 9000, 20);
       
INSERT INTO Orders
VALUES (1 , 45000, 3, 1, 4, 1, 1, '2020-7-04', 4545451), (2 , 80000, 4, 2, 5, 2, 2, '2020-8-04', 89891111);

INSERT INTO Customer
VALUES (1 , 'Billy Joel', 1), (2 , 'Joey Diaz', 2);