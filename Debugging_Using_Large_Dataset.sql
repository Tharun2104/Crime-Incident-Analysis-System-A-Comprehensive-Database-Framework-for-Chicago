
Two Insert Queries
-------------------------------------------------------------
INSERT INTO crime (report_no, case_number, date, block, location_description, 
arrest, domestic, beat, district_no, community_area_no, latitude, longitude)
VALUES (12350, 'C1234573', '2024-11-25 10:15:00', 'Block 4567', 'Robbery', TRUE, 
FALSE, 5, 1, 3, 41.8900, -87.6325);


------------------------------------------------------------
INSERT INTO ward (ward_no, alderman_first_name, alderman_last_name, 
alderman_name_suffix, ward_office_address, ward_office_zip, ward_email, ward_office_phone, 
ward_office_fax, city_hall_office_room, city_hall_office_phone, city_hall_office_fax, population)
VALUES (81, 'John', 'Doe', 'Jr.', '123 City Hall, Room 456', 60605, 'john.doe@chicago.gov', 
'312-555-6789', '312-555-9876', '101A', '312-555-1122', '312-555-2233', 35000);


---------------------------------------------------------------
Two Update Queries
---------------------------------------------------------------
UPDATE crime
SET location_description = 'Armed Robbery', 
    arrest = FALSE, 
    domestic = TRUE,
    beat = 6,
    latitude = 41.8950,  
    longitude = -87.6330  
WHERE report_no = 12350;
-------------------------------------------------------------
UPDATE ward
SET alderman_first_name = 'Jane', 
    alderman_last_name = 'Smith', 
    ward_office_address = '456 New City Hall, Room 789', 
    ward_office_phone = '312-555-1111',
    population = 40000
WHERE ward_no = 81;


--------------------------------------------------------------
Two Delete Queries
----------------------------------------------------------
DELETE FROM crime WHERE report_no = 12350;

---------------------------------------------------------------
DELETE FROM ward WHERE ward_no = 12;

-------------------------------------------------------------------


---------------------------------------------------------------------
Four Select Queries
---------------------------------------------------------------------

SELECT d.district_name, COUNT(c.report_no) AS crime_count
FROM crime c
JOIN district d ON c.district_no = d.district_no
GROUP BY d.district_name
ORDER BY crime_count DESC;

-------------------------------------------------------------------
SELECT c.report_no, c.case_number, f.title AS crime_type, c.date 
FROM crime c
JOIN fbi_code f ON c.fbi_code_no = f.fbi_code_no
WHERE c.date BETWEEN '2019-01-01' AND '2019-06-01'
ORDER BY c.date DESC;

---------------------------------------------------------------------
SELECT d.district_name, COUNT(c.report_no) AS crime_count, AVG(c.latitude) AS avg_latitude
FROM crime c
JOIN district d ON c.district_no = d.district_no
JOIN ward w ON c.ward_no = w.ward_no
WHERE c.date BETWEEN '2019-01-01' AND '2019-06-01'
GROUP BY d.district_name
ORDER BY crime_count DESC;
-------------------------------------------------------------------------
SELECT c.report_no, c.case_number, c.district_no, c.date
FROM crime c
WHERE c.district_no IN (
    SELECT district_no
    FROM crime
    GROUP BY district_no
    ORDER BY COUNT(*) DESC
    LIMIT 3
)
ORDER BY c.date DESC;