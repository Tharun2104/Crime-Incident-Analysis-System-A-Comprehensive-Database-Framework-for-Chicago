--  INSERTING DATA FROM THE CSV TABLES


-- District Table
COPY district
FROM 'C:/DMQL_Project_Data/District_Cleaned.csv'
DELIMITER ','
CSV HEADER;

Select * from district;


-------------------------------------------------------

--FBI Code
COPY fbi_code
FROM 'C:/DMQL_Project_Data/FBI_Code.csv'
DELIMITER ','
CSV HEADER;

Select * from fbi_code;

-------------------------------------------------------------------

--community_area
COPY community_area
FROM 'C:/DMQL_Project_Data/Community_Area_Cleaned.csv'
DELIMITER ','
CSV HEADER;

Select * from community_area;

-----------------------------------------------------------------------

--community_area
COPY iucr
FROM 'C:/DMQL_Project_Data/IUCR.csv'
DELIMITER ','
CSV HEADER;

Select * from iucr;

----------------------------------------------------------------------

--ward
COPY ward
FROM 'C:/DMQL_Project_Data/ward_data_cleaned.csv'
DELIMITER ','
CSV HEADER;

Select * from ward;


---------------------------------------------------------------------

--neighborhood
COPY neighborhood
FROM 'C:/DMQL_Project_Data/Neighborhood.csv'
DELIMITER ','
CSV HEADER;

select * from Neighborhood;

---------------------------------------------------------------------

--Crime
COPY crime
FROM 'C:/DMQL_Project_Data/Crime_data_cleaned.csv'
DELIMITER ','
CSV HEADER;

Select * from crime;


------------------------------------------------------------------
