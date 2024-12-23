import streamlit as st
import pandas as pd
from sqlalchemy import create_engine # type: ignore

# Define the database connection URI
# db_uri = "postgresql+psycopg2://chmanish2807:chmanish2807@localhost:5432/soccer"

db_uri = "postgresql+psycopg2://postgres:Tharun%40256@127.0.0.1:5432/Chicago_Crime Database"
engine = create_engine(db_uri)

def run_query(query, params=None):
    """Executes a SQL query and returns the results as a DataFrame."""
    with engine.connect() as connection:
        return pd.read_sql(query, connection, params=params)

# Streamlit app structure
st.title("Chicago Crime Database")

# Page navigation
page = st.sidebar.radio(
    "Go to",
    ["district", "fbi_code", "community_area", "iucr", "ward","neighborhood","crime", "Custom Query"]
)

# District page
# if page == "district":
#     st.header("Districts")

#     district_query_options = [
#         "Districts by Commander",
#         "Districts by Zip Code"
#     ]

#     selected_district_query = st.selectbox("Select a district query:", district_query_options)

#     if selected_district_query == "Districts by Commander":
#         commander = st.text_input("Enter commander name (e.g., 'Commander Green'):")
#         district_query = f"""
#         SELECT * FROM district WHERE commander LIKE '%{commander}%' LIMIT 10;
#         """
#     elif selected_district_query == "Districts by Zip Code":
#         zip_code = st.number_input("Enter zip code (e.g., '60601'):", min_value=10000, max_value=99999)
#         district_query = f"""
#         SELECT * FROM district WHERE zip_code = {zip_code} LIMIT 10;
#         """

#     district_df = run_query(district_query)
#     st.write(district_df)

# District query page
if page == "district":
    st.header("Districts")

    district_query_options = [
        "Districts by Commander",
        "Districts by Zip Code"
    ]

    selected_district_query = st.selectbox("Select a district query:", district_query_options)

    if selected_district_query == "Districts by Commander":
        commander = st.text_input("Enter commander name (e.g., 'Glenn White'):").strip()

        if commander:  # Ensure the input is not empty
            district_query = """
            SELECT * FROM district WHERE commander LIKE %s LIMIT 10;
            """
            # Use wildcards for partial matching
            params = (f"%{commander}%",)

            # Execute the query with parameters
            district_df = run_query(district_query, params=params)
            st.write(district_df)
    elif selected_district_query == "Districts by Zip Code":
        zip_code = st.number_input("Enter zip code (e.g., '60616'):", min_value=10000, max_value=99999)

        if zip_code:  # Ensure the zip code is valid
            district_query = """
            SELECT * FROM district WHERE zip_code = %s LIMIT 10;
            """
            # Execute the query with parameters
            params = (zip_code,)

            district_df = run_query(district_query, params=params)
            st.write(district_df)

# FBI Codes page
elif page == "fbi_code":
    st.header("FBI Codes")

    fbi_code_query_options = [
        "FBI Codes by Crime Type",
        "FBI Codes by Crime Against"
    ]

    selected_fbi_code_query = st.selectbox("Select an FBI code query:", fbi_code_query_options)

    if selected_fbi_code_query == "FBI Codes by Crime Type":
        crime_type = st.text_input("Enter crime type (e.g., 'Burglary', 'Theft'):")
        if crime_type:  # Ensure input is not empty
            fbi_code_query = """
            SELECT * FROM fbi_code WHERE title LIKE %s LIMIT 10;
            """
            params = (f"%{crime_type}%",)  # Use wildcards for partial matching
            fbi_code_df = run_query(fbi_code_query, params=params)
            st.write(fbi_code_df)

    elif selected_fbi_code_query == "FBI Codes by Crime Against":
        crime_against = st.text_input("Enter the type of crime against (e.g., 'Property', 'Persons'):")
        if crime_against:  # Ensure input is not empty
            fbi_code_query = """
            SELECT * FROM fbi_code WHERE crime_against LIKE %s LIMIT 10;
            """
            params = (f"%{crime_against}%",)  # Use wildcards for partial matching
            fbi_code_df = run_query(fbi_code_query, params=params)
            st.write(fbi_code_df)

# Community Area page
elif page == "community_area":
    st.header("Community Areas")

    community_area_query_options = [
        "Community Areas by Population",
        "Community Areas by Name"
    ]

    selected_community_area_query = st.selectbox("Select a community area query:", community_area_query_options)

    if selected_community_area_query == "Community Areas by Population":
        community_area_query = "SELECT * FROM community_area ORDER BY population DESC LIMIT 10;"
        community_area_df = run_query(community_area_query)
        st.write(community_area_df)

    elif selected_community_area_query == "Community Areas by Name":
        area_name = st.text_input("Enter community area name (e.g., 'New City'):")
        if area_name:  # Ensure input is not empty
            community_area_query = """
            SELECT * FROM community_area WHERE community_area_name LIKE %s LIMIT 10;
            """
            params = (f"%{area_name}%",)  # Use wildcards for partial matching
            community_area_df = run_query(community_area_query, params=params)
            st.write(community_area_df)

# IUCR page
elif page == "iucr":
    st.header("IUCR Codes")

    iucr_query_options = [
        "IUCR Codes by Description",
        "IUCR Codes by Index Code"
    ]

    selected_iucr_query = st.selectbox("Select an IUCR query:", iucr_query_options)

    if selected_iucr_query == "IUCR Codes by Description":
        description = st.text_input("Enter description (e.g., 'HOMICIDE', 'BATTERY'):")
        if description:  # Ensure input is not empty
            iucr_query = """
            SELECT * FROM iucr WHERE primary_description LIKE %s LIMIT 10;
            """
            params = (f"%{description}%",)  # Use wildcards for partial matching
            iucr_df = run_query(iucr_query, params=params)
            st.write(iucr_df)

    elif selected_iucr_query == "IUCR Codes by Index Code":
        index_code = st.text_input("Enter index code (e.g., 'I', 'N'):")
        if index_code:  # Ensure input is not empty
            iucr_query = """
            SELECT * FROM iucr WHERE index_code = %s LIMIT 10;
            """
            params = (index_code,)  # No wildcards needed for exact match
            iucr_df = run_query(iucr_query, params=params)
            st.write(iucr_df)

# Ward page
elif page == "ward":
    st.header("Wards")

    ward_query_options = [
        "Wards by Population",
        "Wards by Alderman"
    ]

    selected_ward_query = st.selectbox("Select a ward query:", ward_query_options)

    if selected_ward_query == "Wards by Population":
        ward_query = "SELECT * FROM ward ORDER BY population DESC LIMIT 10;"
        ward_df = run_query(ward_query)
        st.write(ward_df)

    elif selected_ward_query == "Wards by Alderman":
        alderman_name = st.text_input("Enter alderman name (e.g., 'Brian'):")
        if alderman_name:  # Ensure input is not empty
            ward_query = """
            SELECT * FROM ward WHERE alderman_first_name LIKE %s OR alderman_last_name LIKE %s LIMIT 10;
            """
            params = (f"%{alderman_name}%", f"%{alderman_name}%")  # Use wildcards for partial matching
            ward_df = run_query(ward_query, params=params)
            st.write(ward_df)

# Neighborhood page
elif page == "neighborhood":
    st.header("Neighborhoods")

    neighborhood_query_options = [
        "Neighborhoods by Community Area",
        "Neighborhoods by Name"
    ]

    selected_neighborhood_query = st.selectbox("Select a neighborhood query:", neighborhood_query_options)

    if selected_neighborhood_query == "Neighborhoods by Community Area":
        community_area_no = st.number_input("Enter community area number (e.g., 1):", min_value=1)
        if community_area_no:  # Ensure input is not empty
            neighborhood_query = """
            SELECT * FROM neighborhood WHERE community_area_no = %s LIMIT 10;
            """
            params = (community_area_no,)  # Exact match for numeric value
            neighborhood_df = run_query(neighborhood_query, params=params)
            st.write(neighborhood_df)

    elif selected_neighborhood_query == "Neighborhoods by Name":
        neighborhood_name = st.text_input("Enter neighborhood name (e.g., 'Chinatown'):")
        if neighborhood_name:  # Ensure input is not empty
            neighborhood_query = """
            SELECT * FROM neighborhood WHERE neighborhood_name LIKE %s LIMIT 10;
            """
            params = (f"%{neighborhood_name}%",)  # Use wildcards for partial matching
            neighborhood_df = run_query(neighborhood_query, params=params)
            st.write(neighborhood_df)

# Crime page
elif page == "crime":
    st.header("Crime Records")

    crime_query_options = [
        "Crimes by District",
        "Crimes by Date Range",
        "Crimes by IUCR Code",
        "Crimes by FBI Code"
    ]

    selected_crime_query = st.selectbox("Select a crime query:", crime_query_options)

    if selected_crime_query == "Crimes by District":
        district_no = st.number_input("Enter district number (e.g., 1):", min_value=1)
        if district_no:  # Ensure input is not empty
            crime_query = """
            SELECT * FROM crime WHERE district_no = %s LIMIT 10;
            """
            params = (district_no,)  # Exact match for numeric value
            crime_df = run_query(crime_query, params=params)
            st.write(crime_df)

    elif selected_crime_query == "Crimes by Date Range":
        start_date = st.date_input("Start Date:")
        end_date = st.date_input("End Date:")
        if start_date and end_date:  # Ensure dates are provided
            crime_query = """
            SELECT * FROM crime WHERE date BETWEEN %s AND %s LIMIT 10;
            """
            params = (start_date, end_date)
            crime_df = run_query(crime_query, params=params)
            st.write(crime_df)

    elif selected_crime_query == "Crimes by IUCR Code":
        iucr_code = st.text_input("Enter IUCR code (e.g., '1150', '1192'):")
        if iucr_code:  # Ensure input is not empty
            crime_query = """
            SELECT * FROM crime WHERE iucr_no = %s LIMIT 10;
            """
            params = (iucr_code,)  # Exact match for string
            crime_df = run_query(crime_query, params=params)
            st.write(crime_df)

    elif selected_crime_query == "Crimes by FBI Code":
        fbi_code = st.text_input("Enter FBI code (e.g., '18', '11'):")
        if fbi_code:  # Ensure input is not empty
            crime_query = """
            SELECT * FROM crime WHERE fbi_code_no = %s LIMIT 10;
            """
            params = (fbi_code,)  # Exact match for string
            crime_df = run_query(crime_query, params=params)
            st.write(crime_df)

# Custom Query page
elif page == "Custom Query":
    st.header("Custom Query")

    # Input box for user-defined SQL query
    user_query = st.text_area("Enter your SQL query here:", "")

    # Button to execute the query
    if st.button("Run Query"):
        if user_query.strip():  # Check if the user has entered a query
            try:
                # Run and display the user-defined query
                result_df = run_query(user_query)
                st.write(result_df)
            except Exception as e:
                st.error(f"An error occurred: {e}")
        else:
            st.error("Please enter a valid SQL query.")