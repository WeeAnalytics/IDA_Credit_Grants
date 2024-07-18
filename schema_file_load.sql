-- create a table for IDA credit and grants statement
CREATE TABLE credit_grants (
 
    end_of_period	TIMESTAMP,
    credit_number	VARCHAR,
    region	        VARCHAR,
    country_code	VARCHAR,
    country	        VARCHAR,
    borrower	    VARCHAR,
    credit_status	VARCHAR,
    service_charge_rate	NUMERIC,
    currency_of_commitment	VARCHAR,
    project_id	    VARCHAR,
    project_name	VARCHAR,
    original_principal_amount	NUMERIC,
    cancelled_amount	NUMERIC,
    undisbursed_amount	NUMERIC,
    disbursed_amount	NUMERIC,
    repaid_to_ida	    NUMERIC,
    due_to_ida	        NUMERIC,
    exchange_adjustment	VARCHAR,
    borrower_s_obligation	NUMERIC,
    sold_3rd_party	    NUMERIC,
    repaid_3rd_party	NUMERIC,
    due_3rd_party	    NUMERIC,
    credits_held	    NUMERIC,
    first_repayment_date	TIMESTAMP,
    last_repayment_date	    TIMESTAMP,
    agreement_signing_date	TIMESTAMP,
    board_approval_date	    TIMESTAMP,
    effective_date_most_recent_	TIMESTAMP,
    closed_date_most_recent_	TIMESTAMP,
    last_disbursement_date	    TIMESTAMP

 );

-- loading data into the credit_grants table
COPY credit_grants
FROM '/mnt/c/Users/kyoto/OneDrive/Documents/IDA_credit_grants_SQL/IDA_credits_and_grants.csv'
DELIMITER ',' 
CSV HEADER;

SELECT *
FROM credit_grants;

--Create a table for population
CREATE TABLE world_popn (

country	        VARCHAR,
country_code	VARCHAR,
indicator	    VARCHAR,
indicator_code	VARCHAR,
"1960"	NUMERIC,
"1961"	NUMERIC,
"1962"	NUMERIC,
"1963"	NUMERIC,
"1964"	NUMERIC,
"1965"	NUMERIC,
"1966"	NUMERIC,
"1967"	NUMERIC,
"1968"	NUMERIC,
"1969"	NUMERIC,
"1970"	NUMERIC,
"1971"	NUMERIC,
"1972"	NUMERIC,
"1973"	NUMERIC,
"1974"	NUMERIC,
"1975"	NUMERIC,
"1976"	NUMERIC,
"1977"	NUMERIC,
"1978"	NUMERIC,
"1979"	NUMERIC,
"1980"	NUMERIC,
"1981"	NUMERIC,
"1982"	NUMERIC,
"1983"	NUMERIC,
"1984"	NUMERIC,
"1985"	NUMERIC,
"1986"	NUMERIC,
"1987"	NUMERIC,
"1988"	NUMERIC,
"1989"	NUMERIC,
"1990"	NUMERIC,
"1991"	NUMERIC,
"1992"	NUMERIC,
"1993"	NUMERIC,
"1994"	NUMERIC,
"1995"	NUMERIC,
"1996"	NUMERIC,
"1997"	NUMERIC,
"1998"	NUMERIC,
"1999"	NUMERIC,
"2000"	NUMERIC,
"2001"	NUMERIC,
"2002"	NUMERIC,
"2003"	NUMERIC,
"2004"	NUMERIC,
"2005"	NUMERIC,
"2006"	NUMERIC,
"2007"	NUMERIC,
"2008"	NUMERIC,
"2009"	NUMERIC,
"2010"	NUMERIC,
"2011"	NUMERIC,
"2012"	NUMERIC,
"2013"	NUMERIC,
"2014"	NUMERIC,
"2015"	NUMERIC,
"2016"	NUMERIC,
"2017"	NUMERIC,
"2018"	NUMERIC,
"2019"	NUMERIC,
"2020"	NUMERIC,
"2021"	NUMERIC,
"2022"	NUMERIC,
"2023"	NUMERIC

 );

 -- loading data into the world_popn table
COPY world_popn
FROM '/mnt/c/Users/kyoto/OneDrive/Documents/IDA_credit_grants_SQL/Population.csv'
DELIMITER ',' 
CSV HEADER 
NULL '';

SELECT *
FROM world_popn;


--Create a table for gross domestic product (GDP)
CREATE TABLE GDP (

country	        VARCHAR,
country_code	VARCHAR,
indicator	    VARCHAR,
indicator_code	VARCHAR,
"1960"	NUMERIC,
"1961"	NUMERIC,
"1962"	NUMERIC,
"1963"	NUMERIC,
"1964"	NUMERIC,
"1965"	NUMERIC,
"1966"	NUMERIC,
"1967"	NUMERIC,
"1968"	NUMERIC,
"1969"	NUMERIC,
"1970"	NUMERIC,
"1971"	NUMERIC,
"1972"	NUMERIC,
"1973"	NUMERIC,
"1974"	NUMERIC,
"1975"	NUMERIC,
"1976"	NUMERIC,
"1977"	NUMERIC,
"1978"	NUMERIC,
"1979"	NUMERIC,
"1980"	NUMERIC,
"1981"	NUMERIC,
"1982"	NUMERIC,
"1983"	NUMERIC,
"1984"	NUMERIC,
"1985"	NUMERIC,
"1986"	NUMERIC,
"1987"	NUMERIC,
"1988"	NUMERIC,
"1989"	NUMERIC,
"1990"	NUMERIC,
"1991"	NUMERIC,
"1992"	NUMERIC,
"1993"	NUMERIC,
"1994"	NUMERIC,
"1995"	NUMERIC,
"1996"	NUMERIC,
"1997"	NUMERIC,
"1998"	NUMERIC,
"1999"	NUMERIC,
"2000"	NUMERIC,
"2001"	NUMERIC,
"2002"	NUMERIC,
"2003"	NUMERIC,
"2004"	NUMERIC,
"2005"	NUMERIC,
"2006"	NUMERIC,
"2007"	NUMERIC,
"2008"	NUMERIC,
"2009"	NUMERIC,
"2010"	NUMERIC,
"2011"	NUMERIC,
"2012"	NUMERIC,
"2013"	NUMERIC,
"2014"	NUMERIC,
"2015"	NUMERIC,
"2016"	NUMERIC,
"2017"	NUMERIC,
"2018"	NUMERIC,
"2019"	NUMERIC,
"2020"	NUMERIC,
"2021"	NUMERIC,
"2022"	NUMERIC,
"2023"	NUMERIC

 );

-- loading data into the GDP table
COPY GDP
FROM '/mnt/c/Users/kyoto/OneDrive/Documents/IDA_credit_grants_SQL/GDP.csv'
DELIMITER ',' 
CSV HEADER 
;

 SELECT *
 FROM gdp;

-- create a table for countries and their respective regions
CREATE TABLE countries_regions (
 
    country VARCHAR,
    region  VARCHAR

 );

COPY countries_regions
FROM '/mnt/c/Users/kyoto/OneDrive/Documents/IDA_credit_grants_SQL/countries and regions.csv'
DELIMITER ',' 
CSV HEADER 
;

SELECT *
FROM countries_regions;
