DROP TABLE IF EXISTS district CASCADE;
CREATE TABLE district(
    district_no INTEGER PRIMARY KEY,
    district_name VARCHAR(100),
    address VARCHAR(255),
    zip_code INTEGER,
    commander VARCHAR(200),
    email VARCHAR(200),
    phone VARCHAR(15),
    fax VARCHAR(15),
    tty VARCHAR(15) DEFAULT '000-000-0000',
    twitter VARCHAR(100)
);

------------------------------------------------------------
DROP TABLE IF EXISTS fbi_code CASCADE;
CREATE TABLE fbi_code (
    fbi_code_no VARCHAR(10) PRIMARY KEY,
    title VARCHAR(200),
    description TEXT,
    crime_against VARCHAR(50)
);


-------------------------------------------
DROP TABLE IF EXISTS community_area CASCADE;
CREATE TABLE community_area (
    community_area_no INTEGER PRIMARY KEY,
    community_area_name VARCHAR(250) NOT NULL,
    side VARCHAR(200),
    population INTEGER
);



----------------------------------------------------------
DROP TABLE IF EXISTS iucr CASCADE;
CREATE TABLE iucr(
    iucr_no VARCHAR(10) PRIMARY KEY,
    primary_description VARCHAR(255) NOT NULL,
    secondary_description VARCHAR(255),
    index_code VARCHAR(10)
);


---------------------------------------------------------------

DROP TABLE IF EXISTS ward CASCADE;
CREATE TABLE ward(
    ward_no INTEGER PRIMARY KEY,
    alderman_first_name VARCHAR(50) NOT NULL,
    alderman_last_name VARCHAR(50) NOT NULL,
    alderman_name_suffix VARCHAR(10),
    ward_office_address VARCHAR(255),
    ward_office_zip INTEGER,
    ward_email VARCHAR(255) NULL,
    ward_office_phone VARCHAR(15) NULL,
    ward_office_fax VARCHAR(15) NULL,
    city_hall_office_room VARCHAR(10) NULL,
    city_hall_office_phone VARCHAR(15) NULL,
    city_hall_office_fax VARCHAR(15) NULL,
    population INTEGER
);

-------------------------------------------------------------------

DROP TABLE IF EXISTS neighborhood CASCADE;
CREATE TABLE neighborhood(
    neighborhood_name VARCHAR(255) PRIMARY KEY,
    community_area_no INTEGER,
    FOREIGN KEY (community_area_no) 
        REFERENCES community_area(community_area_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);


-------------------------------------------------------------------
DROP TABLE IF EXISTS crime CASCADE;
CREATE TABLE crime(
    report_no INTEGER PRIMARY KEY,
    case_number VARCHAR(50),
    date TIMESTAMP,
    block VARCHAR(200),
    iucr_no VARCHAR(10),
    location_description VARCHAR(255),
    arrest BOOLEAN,
    domestic BOOLEAN,
    beat INTEGER,
    district_no INTEGER,
    ward_no INTEGER NULL,  -- allows NULL values
    community_area_no INTEGER,
    fbi_code_no VARCHAR(10),
    latitude FLOAT NULL,    -- allows NULL values
    longitude FLOAT NULL,   -- allows NULL values
    -- Foreign Key Constraints
    FOREIGN KEY (district_no) 
        REFERENCES district(district_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,

    FOREIGN KEY (fbi_code_no) 
        REFERENCES fbi_code(fbi_code_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,

    FOREIGN KEY (community_area_no) 
        REFERENCES community_area(community_area_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,

    FOREIGN KEY (iucr_no) 
        REFERENCES iucr(iucr_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,

    FOREIGN KEY (ward_no) 
        REFERENCES ward(ward_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

