--inserting some values for debugging purposes
--inserting data into district table
INSERT INTO district (district_no, district_name, address, zip_code, commander, email, phone, fax, tty, twitter) VALUES
(1, 'Central', '1718 South State Street', 60616, 'Jake M. Alderden', 'CAPS001District@chicagopolice.org', '312-745-4290', '312-745-3694', '312-745-3693', 'ChicagoCAPS01'),
(4, 'South Chicago', '2255 East 103rd St', 60617, 'Robert A. Rubio', 'caps.004district@chicagopolice.org', '312-747-8205', '312-747-4559', '312-747-9169', 'ChicagoCAPS04'),
(5, 'Calumet', '727 East 111th St', 60628, 'Glenn White', 'CAPS005District@chicagopolice.org', '312-747-8210', '312-747-5935', '312-747-9170', 'ChicagoCAPS05'),
(6, 'Gresham', '7808 South Halsted Street', 60620, 'Rahman S. Muhammad', 'CAPS006District@chicagopolice.org', '312-745-3610', '312-745-3649', '312-745-3639', 'ChicagoCAPS06'),
(7, 'Englewood', '1438 W. 63rd Street', 60636, 'Larry Snelling', 'CAPS007District@chicagopolice.org', '312-747-8220', '312-747-6558', '312-747-6652', 'ChicagoCAPS07');

--running a update query
UPDATE district
SET commander = 'Jake Alderden'
WHERE district_no = 1;

--running an alter query
ALTER TABLE district
ADD emergency_contact VARCHAR(100);

ALTER TABLE district
DROP COLUMN emergency_contact;

--deleteing the inserted data
DELETE FROM district;
select* from district;

-----------------------------------------------------------------------------
--inserting data into fbi_code
INSERT INTO fbi_code (fbi_code_no, title, description, crime_against) VALUES
('01A', 'Homicide 1st & 2nd Degree', 'The killing of one human being by another.', 'Persons'),
('01B', 'Involuntary Manslaughter', 'The killing of another person through negligence.', 'Persons'),
('3', 'Robbery', 'The taking or attempting to take anything of value under confrontational circumstances from the control, custody, or care of another person by force or threat of force or violence and/or by putting the victim in fear of immediate harm.', 'Property'),
('04A', 'Aggravated Assault', 'An unlawful attack by one person upon another wherein the offender displays a weapon in a threatening manner. Placing someone in reasonable apprehension of receiving a battery.', 'Persons');

UPDATE fbi_code
SET title = 'Homicide - 1st & 2nd Degree'
WHERE fbi_code_no = '01A';

ALTER TABLE fbi_code
ADD penalty VARCHAR(100);

ALTER TABLE fbi_code
DROP COLUMN penalty;

DELETE FROM fbi_code;
select * from fbi_code;

-----------------------------------------------------------------------
--inserting data into community_area

INSERT INTO community_area (community_area_no, community_area_name, side, population) VALUES
(1, 'Rogers Park', 'Far North Side', 54991),
(2, 'West Ridge', 'Far North Side', 71942),
(3, 'Uptown', 'Far North Side', 56362),
(4, 'Lincoln Square', 'Far North Side', 39493),
(5, 'North Center', 'North Side', 31867);

UPDATE community_area
SET population = 58000
WHERE community_area_no = 3;

ALTER TABLE community_area
ADD area_size DECIMAL(10, 2);

ALTER TABLE community_area
DROP COLUMN area_size;

DELETE FROM community_area;
select * from community_area;

-----------------------------------------------------------------
--inserting data into iucr table
INSERT INTO iucr (iucr_no, primary_description, secondary_description, index_code) VALUES
('110', 'HOMICIDE', 'FIRST DEGREE MURDER', 'I'),
('130', 'HOMICIDE', 'SECOND DEGREE MURDER', 'I'),
('141', 'HOMICIDE', 'INVOLUNTARY MANSLAUGHTER', 'N'),
('041A', 'BATTERY', 'AGGRAVATED: HANDGUN', 'I'),
('041B', 'BATTERY', 'AGGRAVATED: OTHER FIREARM', 'I');

UPDATE iucr
SET secondary_description = 'MURDER - SECOND DEGREE'
WHERE iucr_no = '130';

ALTER TABLE iucr
ADD severity_level INT;

ALTER TABLE iucr
DROP COLUMN severity_level;

DELETE FROM iucr;
select * from iucr;

------------------------------------------------------------------
--inserting into ward table

INSERT INTO ward (ward_no, alderman_first_name, alderman_last_name, alderman_name_suffix, ward_office_address, ward_office_zip, ward_email, ward_office_phone, ward_office_fax, city_hall_office_room, city_hall_office_phone, city_hall_office_fax, Population) VALUES
(1, 'Daniel', 'La Spata', '', '1958 N. Milwaukee Ave.', '60647', 'info@the1stward.com', '872.206.2685', '312.448.8829', '200', NULL, NULL, 56149);

UPDATE ward SET ward_email = 'new_email@cityofchicago.org'
WHERE ward_no = 1;

ALTER TABLE ward
ADD alderman_photo VARCHAR(255);

ALTER TABLE ward
DROP COLUMN alderman_photo;

DELETE FROM ward;
select * from ward;

-------------------------------------------------------------------------------
--inserting data into neighborhood
INSERT INTO neighborhood (neighborhood_name, community_area_no) VALUES
('Albany Park', 1),
('Altgeld Gardens', 2),
('Andersonville', 3),
('Archer Heights', 4),
('Armour Square', 5);

UPDATE neighborhood
SET community_area_no = 78
WHERE neighborhood_name = 'Andersonville';

ALTER TABLE neighborhood
ADD zipcode VARCHAR(10);

ALTER TABLE neighborhood
DROP COLUMN zipcode;

DELETE FROM neighborhood;
select * from neighborhood;

-----------------------------------------------------------------------
--inserting data into crime table

INSERT INTO crime (report_no, case_number, date, block, iucr_no, location_description, arrest, domestic, beat, district_no, ward_no, community_area_no, fbi_code_no, latitude, longitude) VALUES
(11614220, 'JC174738', '2019-03-01 14:00:00', '052XX W CRYSTAL ST', '1152', 'OTHER', FALSE, FALSE, 2532, 25, 37, 25, 11, NULL, NULL),
(11616238, 'JC176798', '2019-01-11 15:30:00', '029XX N LAKE SHORE DR', '1130', 'RESIDENCE', FALSE, FALSE, 1934, 19, 44, 6, 11, NULL, NULL),
(11617189, 'JC177948', '2019-02-20 13:30:00', '005XX W WELLINGTON AVE', '890', 'APARTMENT', FALSE, FALSE, 1934, 19, 44, 6, 6, NULL, NULL),
(11554513, 'JC101543', '2019-01-01 22:55:00', '038XX N OAKLEY AVE', '880', 'STREET', FALSE, FALSE, 1921, 19, 47, 5, 6, NULL, NULL),
(11556037, 'JC103643', '2019-01-03 19:20:00', '0000X W RWY 27R', '2890', 'AIRCRAFT', FALSE, FALSE, 1654, 16, 41, 76, 26, 42.00282, -87.9061);


UPDATE crime
SET location_description = 'PARK'
WHERE case_number = 'JC174738';

ALTER TABLE crime
ADD officer_id INT;

ALTER TABLE crime
DROP COLUMN officer_id;

DELETE FROM crime;
select * from crime;






























